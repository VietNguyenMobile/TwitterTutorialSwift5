//
//  ActionSheetLauncher.swift
//  TwitterTutorial
//
//  Created by Macbook on 11/04/2023.
//

import Foundation

class ActionSheetLauncher: NSObject {
    
    // MARK: - Properties
    
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init()
    }
    
    // MARK: - Helpers
    
    func show() {
        print("DEBUG: Show action sheet for user \(user.username)")
    }
}
