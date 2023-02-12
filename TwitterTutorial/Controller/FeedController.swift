//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by Macbook on 07/02/2023.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            print("DEBUG: Did set user in feed controller..")
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        
//        navigationController?.navigationBar.barTintColor = .red
        
//        tabBarController?.tabBar.barTintColor = .red
//        UINavigationBar.appearance().barTintColor = .green
//        UINavigationBar.appearance().backgroundColor = .green
//        UITabBar.appearance().barTintColor = .yellow
//        UINavigationBar.appearance().barTintColor = .red
//        UINavigationBar.appearance().tintColor = .white
//        UINavigationBar.appearance().isTranslucent = true
        
//        navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
//        navigationController?.navigationBar.shadowImage
//        navigationController?.navigationBar.layoutIfNeeded()
//        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
}
