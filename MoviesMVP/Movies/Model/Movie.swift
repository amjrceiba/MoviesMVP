//
//  Movie.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import Foundation

public struct Movie: Codable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, title: String
    let releaseDate:String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
