//
//  MoviesController.swift
//  MoviesMVP
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 22/06/21.
//

import UIKit

class MoviesViewController: ViewController<MoviesView> {

    private var movies: [Movie] = [] {
        didSet {
            customView.tableview.reloadData()
        }
    }
    
    private var moviesPresenter: MoviesPresenter?
    
    override func viewDidLoad() {
        setDelegates()
        fetchMovies()
    }
    
    func setDelegates(){
        customView.tableview.delegate = self
        customView.tableview.dataSource = self
        moviesPresenter = MoviesPresenter(delegate: self)
    }
    
    func fetchMovies(){
        moviesPresenter!.fetchMovies()
    }
}

extension MoviesViewController: MoviesPresenterDelegate, UITableViewDelegate, UITableViewDataSource{
    
    func presentMovies(movies: [Movie]) {
        DispatchQueue.main.async {
            self.movies = movies
        }
    }
    
    func presentMovie(movie: Movie) {
        let viewController = MovieDetailViewController(with: movie)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.configureWith(movie: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        moviesPresenter!.didTap(movie: movies[indexPath.row])
    }
}
