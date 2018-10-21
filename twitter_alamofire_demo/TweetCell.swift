//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Chris Q. on 10/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var proPic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var retweets: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    var timeline: TimelineViewController?
    
    var tweet: Tweet? {
        didSet{
            if(tweet?.favorited == true){
                likeButton.setImage(UIImage(named: "favor-icon-red.png"), for: .normal)
            }
            if(tweet?.retweeted == true){
                retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: .normal)
            }
            
            proPic?.af_setImage(withURL: (tweet?.user.profilepic)!)
            name.text = tweet?.user.name
            username.text = tweet?.user.screenName
            tweetText.text = tweet?.text
            retweets.text = String(tweet!.retweetCount)
            likes.text = String(tweet!.favoriteCount)
        }
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        print("retweeting")
        APIManager.shared.retweet(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                self.timeline?.fetchTweets()
            }
        }
    }
  
    @IBAction func onLike(_ sender: Any) {
        print("liking")
        APIManager.shared.favorite(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
                self.timeline?.fetchTweets()
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
