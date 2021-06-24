//
//  MovieDetailPresenter.swift
//  MoviesMVP
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 22/06/21.
//

import Foundation
import UIKit

protocol MoviePresenterDelegate: AnyObject {
    func presentAddButton(addButton: Bool)
    func popView()
    func notifyObserver()
    func showErrorAlert(title: String, message: String)
}

typealias MovieDetailDelegate = MoviePresenterDelegate & UIViewController

class MovieDetailPresenter {
    
    private weak var delegate: MovieDetailDelegate?
    var movieExist = true
    
    init(delegate: MovieDetailDelegate) {
        self.delegate = delegate
    }
    
    public func checkAddButton(movie: Movie){
        do{
            movieExist = try DBController().checkForMovie(movie: movie)
            delegate?.presentAddButton(addButton: movieExist)
        }
        catch{
            delegate?.showErrorAlert(title: "Error", message: error.localizedDescription)
        }
    }
    
    public func addButtonTap(movie: Movie){
        do{
            movieExist ? try removeMovie(movie: movie) : try addMovie(movie: movie)
        }
        catch{
            delegate?.showErrorAlert(title: "Error", message: error.localizedDescription)
        }
    }
    
    func addMovie(movie: Movie)throws{
        try DBController().addMovie(movie: movie)
        delegate?.notifyObserver()
        delegate?.popView()
    }
    
    func removeMovie(movie: Movie)throws{
        try DBController().removeMovie(movie: movie)
        delegate?.notifyObserver()
        delegate?.popView()
    }
}
