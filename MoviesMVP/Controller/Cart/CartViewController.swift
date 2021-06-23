//
//  CartViewController.swift
//  MoviesMVP
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 23/06/21.
//

import UIKit

class CartViewController: ViewController<CartView> {

    private let cartPresenter = CartPresenter()
    
    private var movies: [Movie] = [] {
        didSet {
            customView.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMovies()
    }
    
    func setDelegates(){
        cartPresenter.setViewDelegate(delegate: self)
        customView.tableview.delegate = self
        customView.tableview.dataSource = self
    }
    
    func loadMovies(){
        cartPresenter.loadMovies()
    }

}

extension CartViewController: CartPresenterDelegate, CartTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource{

    func presentMovies(movies: [Movie]) {
        DispatchQueue.main.async {
            self.movies = movies
        }
    }
    
    func presentRemoveMovieAlert(title: String, message: String, movie: Movie) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.cartPresenter.removeMovie(movie: movie)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        cell.configureWith(movie: movies[indexPath.row], delegate: self)
        cell.selectionStyle = .none
        return cell
    }
    
    func cartTableViewCell(_ cartTableviewCell: CartTableViewCell, movie: Movie) {
        cartPresenter.removeButtonPressed(movie: movie)
    }
}
