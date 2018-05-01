//
//  PopularMovieCell.swift
//  MovieApp
//
//  Created by user132893 on 4/27/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import AlamofireImage

class PopularMovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var uiImage: UIImageView!
    
    
    var movie: Movie!{
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            uiImage.af_setImage(withURL: movie.posterUrl!)
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
