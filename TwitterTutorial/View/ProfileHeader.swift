//
//  ProfileHeader.swift
//  TwitterTutorial
//
//  Created by Macbook on 14/02/2023.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
