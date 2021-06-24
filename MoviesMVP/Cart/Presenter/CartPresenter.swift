//
//  CartPresenter.swift
//  MoviesMVP
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 23/06/21.
//

import Foundation
import UIKit

protocol CartPresenterDelegate: AnyObject {
    func presentMovies(movies: [Movie])
    func presentRemoveMovieAlert(title: String, message: String, movie: Movie)
    func presentErrorAlert(title: String, message: String)
}

typealias CartDelegate = CartPresenterDelegate & UIViewController

class CartPresenter {
    private weak var delegate: CartDelegate?
    
    init(delegate: CartDelegate) {
        self.delegate = delegate
    }
    
    public func loadMovies(){
        let movies = DBController().getMovies()
        delegate?.presentMovies(movies: movies)
    }
    
    public func removeButtonPressed(movie: Movie){
        delegate?.presentRemoveMovieAlert(title: "Alert", message: "Do you want to remove \(movie.originalTitle) from your cart?", movie: movie)
    }
    
    public func removeMovie(movie: Movie){
        do{
            try DBController().removeMovie(movie: movie)
        }
        catch{
            delegate?.presentErrorAlert(title: "Error", message: error.localizedDescription)
        }
        
        self.notifyObserver()
        self.loadMovies()
    }
    
    func notifyObserver(){
        NotificationCenter.default.post(name: Notification.Name("updateCartBadge"), object: nil)
    }
    
}
