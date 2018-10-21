//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chris Q. on 10/15/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    weak var delegate: ComposeViewControllerDelegate?
    @IBOutlet weak var imView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextField: UITextView!
    @IBOutlet weak var charsRemainLabel: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imView.af_setImage(withURL: user.profilepic!)
        nameLabel.text = user.name
        usernameLabel.text = user.screenName
        tweetTextField.text = ""
        charsRemainLabel.text = "140"
        tweetTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let charLimit = 140
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        charsRemainLabel.text = String(140 - newText.characters.count)
        return newText.characters.count < charLimit
    }
    
    @IBAction func onPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextField.text) { (tweet: Tweet?, error: Error?) in
            if let error = error {
                print("Error tweeting: \(error.localizedDescription)")
            }
            else if let tweet = tweet {
                print("Successfully posted the following tweet: \(tweet.text)")
                self.delegate?.did(post: tweet)
                self.performSegue(withIdentifier: "completedTweet", sender: self)
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
protocol ComposeViewControllerDelegate : class {
    func did(post: Tweet)
}
