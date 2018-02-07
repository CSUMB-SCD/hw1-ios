//
//  NowPlayingViewController.swift
//  MovieApp
//
//  Created by user132893 on 2/4/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var movies: [[String: Any]] = []
    
    var refresh: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refresh, at: 0)
        tableView.dataSource = self
        indicator.startAnimating()
        fetchMovies()
    }
    
    @objc func didPullToRefresh(_ refresh: UIRefreshControl){
        fetchMovies()
    }
    func fetchMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // TODO: Get the array of movies
                let movies = dataDictionary["results"] as! [[String: Any]]
                
                
                // TODO: Store the movies in a property to use elsewhere
                
                self.movies = movies
                // TODO: Reload your table view data
             
                self.tableView.reloadData()
                self.indicator.stopAnimating()
                self.refresh.endRefreshing()
                
            }
        }
        task.resume()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURLString + posterPathString)!
        
        cell.img.af_setImage(withURL: posterURL)
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        return cell
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
