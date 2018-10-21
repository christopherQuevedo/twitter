//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit



class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet] = []
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        cell.timeline = self as TimelineViewController
        return cell
    }
    
    func fetchTweets(){
        APIManager.shared.getHomeTimeLine { (tweets: [Tweet]?, error: Error?) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 200
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector (TimelineViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        fetchTweets()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchTweets()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("trying a segue")
        if(segue.identifier == "detailSegue"){
            print("trying to get detail")
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell){
                let tweet = tweets[indexPath.row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.tweet = tweet
            }
        }
        else if(segue.identifier == "userSegue"){
            print("trying to view profile")
            let user = User.current
            let userViewController = segue.destination as! UserViewController
            userViewController.user = user
        }
        else if(segue.identifier == "composeSegue"){
            print("trying to compose")
            let user = User.current
            let composeViewController = segue.destination as! ComposeViewController
            composeViewController.user = user
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
