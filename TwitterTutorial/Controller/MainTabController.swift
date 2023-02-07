//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by Macbook on 06/02/2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = .red
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        nav1.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: conversations)
        
        nav2.title = "Explore"
        
        viewControllers = [nav1, nav2, nav3, nav4]
//        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
//        nav.navigationBar.backgroundColor = .systemPink
//        nav.navigationBar.barTintColor = .green
        nav.navigationBar.barTintColor = .white
        return nav
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
