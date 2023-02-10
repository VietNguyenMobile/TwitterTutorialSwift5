//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Macbook on 10/02/2023.
//

import UIKit
import FirebaseAuth

struct UserService {
    static let shared = UserService()
    
    func fetchUser() {
        print("DEBUG: Fetch current user info..")
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        print("DEBUG: Current uid is \(uid)")
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            print("DEBUG: Snapshot \(snapshot)")
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            print("DEBUG: Dictionary is \(dictionary)")
            
            guard let username = dictionary["username"] as? String else { return }
            print("DEBUG: Username is \(username)")
        }
    }
}
