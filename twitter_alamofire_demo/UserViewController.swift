//
//  UserViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chris Q. on 10/17/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var proPic: UIImageView!
    @IBOutlet weak var numTweetsLabel: UILabel!
    @IBOutlet weak var numFollowersLabel: UILabel!
    @IBOutlet weak var numFollowingLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proPic.af_setImage(withURL: user.profilepic!)
        numTweetsLabel.text = String(user.statuscount!)
        numFollowersLabel.text = String(user.followercount!)
        numFollowingLabel.text = String(user.friendcount!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
