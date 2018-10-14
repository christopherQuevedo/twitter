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
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var retweets: UILabel!
    @IBOutlet weak var favorites: UILabel!
    
    var tweet: Tweet? {
        didSet{
            proPic?.af_setImage(withURL: (tweet?.user.profilepic)!)
            name.text = tweet?.user.name
            username.text = tweet?.user.screenName
            tweetText.text = tweet?.text
            retweets.text = String(tweet!.retweetCount)
            favorites.text = String(tweet!.favoriteCount!)
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
