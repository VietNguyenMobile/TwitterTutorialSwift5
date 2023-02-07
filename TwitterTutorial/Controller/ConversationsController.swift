//
//  ConversationsController.swift
//  TwitterTutorial
//
//  Created by Macbook on 07/02/2023.
//

import UIKit

class ConversationsController: UIViewController {
   
   // MARK: - Properties
   
   // MARK: - Lifecycle

   override func viewDidLoad() {
       super.viewDidLoad()

       configureUI()
   }
   
   // MARK: - Helpers
   
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Messages"
    }
}
