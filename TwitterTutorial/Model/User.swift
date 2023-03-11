//
//  User.swift
//  TwitterTutorial
//
//  Created by Macbook on 12/02/2023.
//

import Foundation
import FirebaseAuth

struct User {
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: URL?
    let uid: String
    var isFollowed = false
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid}
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        //        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
//            self.profileImageUrl = URL(string: profileImageUrlString)
            self.profileImageUrl = url
        }
    }
}
