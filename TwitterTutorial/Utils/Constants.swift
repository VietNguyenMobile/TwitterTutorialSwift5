//
//  Constants.swift
//  TwitterTutorial
//
//  Created by Macbook on 09/02/2023.
//

import FirebaseDatabase
import FirebaseStorage


let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
let REF_USER_TWEETS = DB_REF.child("user-tweets")
