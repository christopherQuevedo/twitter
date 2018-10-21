//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chris Q. on 10/15/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {

    @IBOutlet weak var favLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imView: UIImageView!
    @IBOutlet weak var retweetBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tweet = tweet {
            nameLabel.text = tweet.user.name
            usernameLabel.text = tweet.user.screenName
            tweetLabel.text = tweet.text
            retweetLabel.text = String(tweet.retweetCount)
            favLabel.text = String(tweet.favoriteCount)
            imView.af_setImage(withURL: tweet.user.profilepic!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        print("retweeting")
        APIManager.shared.retweet(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully retweeted the following Tweet: \n\(tweet.text)")
            }
        }
    }
    
    @IBAction func onLikeBtn(_ sender: Any) {
        print("liking")
        APIManager.shared.favorite(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
