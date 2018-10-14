//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Chris Q. on 10/8/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    // Properties
    var name: String?
    var screenName: String?
    var profilepic: URL?
    var bannerpic: URL?
    var friendcount: Int?
    var followercount: Int?
    var userid: Int64?
    var favoritecount: Int?
    var statuscount: Int?
    
    var dictionary: [String: Any]?
    
    
    // Initializer
    init(dictionary: [String : Any]){
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        if let profile: String = dictionary["profile_image_url_https"] as? String {
            profilepic = URL(string: profile)!
        }
        if let banner: String = dictionary["profile_banner_url"] as? String {
            bannerpic = URL(string: banner)!
        }
        if let screen = dictionary["screen_name"] as? String {
            self.screenName = screen
        }
        friendcount = dictionary["friends_count"] as? Int
        followercount = dictionary["followers_count"] as? Int
        userid = dictionary["userid"] as? Int64
        statuscount = dictionary["status_count"] as? Int
        favoritecount = dictionary["favourite_count"] as? Int
        
        guard let twitid: NSNumber = dictionary["id"] as? NSNumber else {
            print("Twitter id error")
            return
        }
        userid = twitid.int64Value
    }
    
    static var current: User?
    /*
    static var current: User? {
        get{
            let defaults = UserDefaults.standard
            if let userData = defaults.data(forKey: "currentUserData"){
                let dictionary = try! JSONSerialization.data(withJSONObject: userData, options: [])
                defaults.set(userData, forKey: "currentUserData")
            }
            else{
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
 */
    
    
}
