//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit



class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet]!
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    func fetchTweets(){
        print("heree")
        APIManager().getHomeTimeLine { (tweets: [Tweet]?, error: Error?) in
            if let tweets = tweets {
                print("LL")
                self.tweets = tweets
                self.tableView.reloadData()
            }
        }
        /*
         let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
         let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
         let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
         let task = session.dataTask(with: request) { (data, response, error) in
         // This will run when the network request returns
         if let error = error {
         print(error.localizedDescription)
         } else if let data = data {
         let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
         let movies = dataDictionary["results"] as! [[String: Any]]
         self.movies = []
         for dictionary in movies {
         let movie = Movie(dictionary: dictionary)
         self.movies.append(movie)
         }
         self.tableView.reloadData()
         self.refreshControl.endRefreshing()
         }
         }
         task.resume()
         */
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("L")
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector (TimelineViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        tableView.rowHeight = 200
        fetchTweets()
        print("L")
        //APIManager.getHomeTimeLine()
        // Do any additional setup after loading the view.
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchTweets()
        //APIManager().getHomeTimeLine()
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
