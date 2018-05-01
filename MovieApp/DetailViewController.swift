//
//  DetailViewController.swift
//  MovieApp
//
//  Created by user132893 on 2/7/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
enum MovieKeys{
    static let title="title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}
class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie=movie{
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.release_date
            overviewLabel.text = movie.overview
           
            
            let backdropURL = movie.backdropUrl
            backDropImageView.af_setImage(withURL: backdropURL!)
            
            let posterPathURL = movie.posterUrl
            posterImageView.af_setImage(withURL: posterPathURL!)
            
        }
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
