//
//  ExploreController.swift
//  TwitterTutorial
//
//  Created by Macbook on 07/02/2023.
//

import UIKit

class ExploreController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Explore"
        
//        UINavigationBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().tintColor = .white
//        UINavigationBar.appearance().isTranslucent = true
    }
    
}
