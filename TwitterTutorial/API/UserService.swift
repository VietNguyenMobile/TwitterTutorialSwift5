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
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        print("DEBUG: Fetch current user info..")
        
//        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        print("DEBUG: Current uid is \(uid)")
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            print("DEBUG: Snapshot \(snapshot)")
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            print("DEBUG: Dictionary is \(dictionary)")
            
//            guard let username = dictionary["username"] as? String else { return }
//            print("DEBUG: Username is \(username)")
            
            let user = User(uid: uid, dictionary: dictionary)
            
            print("DEBUG: Username is \(user.username)")
            print("DEBUG: Fullname is \(user.fullname)")
            print("DEBUG: ProfileImageUrl is \(user.profileImageUrl)")
            print("DEBUG: Email is \(user.email)")
            
            completion(user)
        }
    }
}
