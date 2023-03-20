//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Macbook on 10/02/2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

typealias DatabaseCompletion = ((Error?, DatabaseReference) -> Void)

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
            
//            print("DEBUG: Username is \(user.username)")
//            print("DEBUG: Fullname is \(user.fullname)")
//            print("DEBUG: ProfileImageUrl is \(user.profileImageUrl)")
//            print("DEBUG: Email is \(user.email)")
            
            completion(user)
        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        REF_USERS.observe(.childAdded) { snapshot in
//            print("DEBUG: fetchUsers \(snapshot)")
            var users = [User]()
            REF_USERS.observe(.childAdded) { snapshot in
                let uid = snapshot.key
                guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
                let user = User(uid: uid, dictionary: dictionary)
                users.append(user)
                completion(users)
            }
        }
    }
    
    func followUser(uid: String, completion: @escaping(DatabaseCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        print("DEBUG: Current uid \(currentUid) started following \(uid)")
        print("DEBUG: Uid \(uid) gained \(uid) as a follower")
        
        REF_USER_FOLLOWING.child(currentUid).updateChildValues([uid: 1]) { (err, ref) in
            REF_USER_FOLLOWERS.child(uid).updateChildValues([currentUid: 1], withCompletionBlock: completion)
        }
    }
    
    func unfollowUser(uid: String, completion: @escaping(DatabaseCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_FOLLOWING.child(currentUid).child(uid).removeValue { (err, ref) in
            REF_USER_FOLLOWERS.child(uid).child(currentUid).removeValue(completionBlock: completion)
        }
    }
    
    func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_FOLLOWING.child(currentUid).child(uid).observeSingleEvent(of: .value) { snapshot in
            print("DEBUG: User is followed is \(snapshot.exists()) ")
            completion(snapshot.exists())
        }
    }
}
