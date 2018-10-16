//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chris Q. on 10/15/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    //weak var delegate: ComposeViewControllerDelegate?
    @IBOutlet weak var imView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextField: UITextView!
    @IBOutlet weak var charsRemainLabel: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelTap(_ sender: Any) {
    }
    @IBAction func onPostTap(_ sender: Any) {
    }
    /*
    protocol ComposeViewControllerDelegate : class {
        func did(post: Tweet)
    }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
