//
//  MovieDetailViewController.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import Foundation
import UIKit

class MovieDetailViewController: ViewController<MovieDetailView> {
    
    let movie: Movie
    private let moviePresenter = MovieDetailPresenter()
    
    init(with movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        
        customView.configureWith(movie: self.movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationItem.title = self.movie.originalTitle
        setDelegates()
        checkAddButton()
    }
    
    func setDelegates(){
        moviePresenter.setViewDelegate(delegate: self)
    }
    
    func checkAddButton(){
        moviePresenter.checkAddButton(movie: movie)
    }
    
    @objc
    func barButtonTapped(){
        moviePresenter.addButtonTap(movie: movie)
    }
}

extension MovieDetailViewController: MoviePresenterDelegate{
    func presentAddButton(addButton: Bool) {
        let barButton = addButton ? UIBarButtonItem.SystemItem.trash : UIBarButtonItem.SystemItem.add
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: barButton, target: self, action: #selector(barButtonTapped))
    }
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
