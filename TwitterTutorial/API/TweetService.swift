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
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: competion)
    }
}
