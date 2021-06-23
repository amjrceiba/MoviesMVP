//
//  DBController.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 16/06/21.
//

import Foundation
import RealmSwift

class DBController {
    func addMovie(movie: Movie)throws{
        let realm = try Realm()
        let movieEntity = MovieTraslator().modelToEntiy(movie: movie)
        try realm.write {
            realm.add(movieEntity)
        }
    }
    
    func checkForMovie(movie: Movie)throws->Bool{
        let movieEntity = MovieTraslator().modelToEntiy(movie: movie)
        let realm = try Realm()
        
        if realm.objects(MovieEntity.self).filter("id == \(movieEntity.id)").first != nil{
            return true
        }

        
        return false
    }
    
    func removeMovie(movie: Movie)throws{
        let movieEntity = MovieTraslator().modelToEntiy(movie: movie)
        let realm = try Realm()
        
        if let movieObject = realm.objects(MovieEntity.self).filter("id == \(movieEntity.id)").first{
            try! realm.write {
                realm.delete(movieObject)
            }
        }
    }
    
    func getMovies()->[Movie]{
        var movies = [Movie]()
        
        let realm = try! Realm()
        let movieEntities = realm.objects(MovieEntity.self)
        
        movies = MovieTraslator().getMoviesModels(movieEntities: movieEntities)
        
        return movies
    }
    
    func removeAllMovies(){
        
    }
}
