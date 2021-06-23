//
//  MovisTraslator.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 16/06/21.
//

import Foundation
import RealmSwift

class MovieTraslator {
    func modelToEntiy(movie: Movie)->MovieEntity{
        let movieEntity = MovieEntity()
        
        movieEntity.adult = movie.adult
        movieEntity.backdropPath = movie.backdropPath ?? ""
        movieEntity.id = movie.id
        movieEntity.originalTitle = movie.originalTitle
        movieEntity.overview = movie.overview
        movieEntity.popularity = movie.popularity
        movieEntity.posterPath = movie.posterPath
        movieEntity.releaseDate = movie.releaseDate ?? ""
        movieEntity.title = movie.title
        movieEntity.video = movie.video
        movieEntity.voteAverage = movie.voteAverage
        movieEntity.voteCount = movie.voteCount
        
        return movieEntity
    }
    
    func entityToModel(movieEntity: MovieEntity)->Movie{
        let movie = Movie(adult: movieEntity.adult, backdropPath: movieEntity.backdropPath, id: movieEntity.id, originalTitle: movieEntity.originalTitle, overview: movieEntity.overview, popularity: movieEntity.popularity, posterPath: movieEntity.posterPath, title: movieEntity.title, releaseDate: movieEntity.releaseDate, video: movieEntity.video, voteAverage: movieEntity.voteAverage, voteCount: movieEntity.voteCount)
        return movie
    }
    
    func getMoviesModels(movieEntities: Results<MovieEntity>)->[Movie]{
        var movies = [Movie]()
        
        for entity in movieEntities {
            let movie = entityToModel(movieEntity: entity)
            movies.append(movie)
        }
        
        return movies
    }
}
