//
//  NotificationCell.swift
//  TwitterTutorial
//
//  Created by Macbook on 02/05/2023.
//

import UIKit

protocol NotificationCellDelegate: class {
    func didTapProfileImage(_ cell: NotificationCell)
}

class NotificationCell: UITableViewCell {
    
    // MARK: - Propertiest
    
    var notification: Notification? {
        didSet {
            configure()
        }
    }
    
    weak var delegate: NotificationCellDelegate?
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapProfileImage))
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "Some test notification message"
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, notificationLabel])
        stack.spacing = 8
        stack.alignment = .center
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        stack.anchor(right: rightAnchor, paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    
    @objc func didTapProfileImage() {
        print("DEBUG: 1111111")
        delegate?.didTapProfileImage(self)
    }
    
    // Mark: - Helpers
    
    func configure() {
        print("DEBUG: Did set notification in cell..")
        guard let notification = notification else { return }
        let viewModel = NotificationViewModel(notification: notification)
        
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        notificationLabel.attributedText = viewModel.notificationText
    }
}
