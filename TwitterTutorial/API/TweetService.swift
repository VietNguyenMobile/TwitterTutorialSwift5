//
//  TweetService.swift
//  TwitterTutorial
//
//  Created by Macbook on 13/02/2023.
//

import FirebaseAuth
import FirebaseDatabase

struct TweetService {
    static let shared = TweetService()
    
    func uploadTweet(caption: String, competion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["uid": uid,
                      "timestamp": Int(NSDate().timeIntervalSince1970),
                      "likes": 0,
                      "retweets": 0,
                      "caption": caption] as [String: Any]
        
        let ref = REF_TWEETS.childByAutoId()
        
        ref.updateChildValues(values) { (err, ref) in
            // update user-tweet structure after tweet upload completes
            guard let tweetID = ref.key else { return }
            REF_USER_TWEETS.child(uid).updateChildValues([tweetID: 1], withCompletionBlock: competion)
            
        }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        REF_TWEETS.observe(.childAdded) { snapshot in
            print("DEBUG: Snapshot Tweet is \(snapshot)")
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let uid = dictionary["uid"] as? String else { return }
            let tweetID = snapshot.key
            
            UserService.shared.fetchUser(uid: uid) { user in
                let tweet = Tweet(user: user, tweetID: tweetID, dictionary: dictionary)
                tweets.append(tweet)
                completion(tweets)
            }
        }
    }
    
    func fetchTweets(forUser user: User, completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
//        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_TWEETS.child(user.uid).observe(.childAdded) { snapshot in
            let tweetID = snapshot.key
            
            REF_TWEETS.child(tweetID).observeSingleEvent(of: .value) { snapshot in
                print("DEBUG: \(snapshot)")
                guard let dictionary = snapshot.value as? [String: Any] else { return }
                guard let uid = dictionary["uid"] as? String else { return }
                let tweetID = snapshot.key
                
                UserService.shared.fetchUser(uid: uid) { user in
                    let tweet = Tweet(user: user, tweetID: tweetID, dictionary: dictionary)
                    tweets.append(tweet)
                    completion(tweets)
                }
            }
        }
    }
}
