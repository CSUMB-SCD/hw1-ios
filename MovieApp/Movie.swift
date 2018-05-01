//
//  Movie.swift
//  MovieApp
//
//  Created by user132893 on 4/27/18.
//  Copyright © 2018 user132893. All rights reserved.
//
import AlamofireImage

class Movie{
    var title: String
    var overview: String
    var release_date: String
    var posterUrl: URL?
    var backdropUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        
        // Set the rest of the properties
        overview = dictionary["overview"] as? String ?? ""
        release_date = dictionary["release_date"] as? String ?? ""
        let base = "https://image.tmdb.org/t/p/w500"
        let posterPath = dictionary["poster_path"] as? String
        posterUrl = URL(string:  base + posterPath!)
        
        let backdropPath = dictionary["backdrop_path"] as? String
        backdropUrl = URL(string: base + backdropPath!)
        
    }
 
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
