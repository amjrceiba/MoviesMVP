//
//  MovieDetailView.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import UIKit

class MovieDetailView: UIView {
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "movie-placeholder")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()
    
    private let overview: UILabel = {
        let label = UILabel()
        label.numberOfLines = 15
        label.font = UIFont.systemFont(ofSize: 14)
        label.sizeToFit()
        return label
    }()
    
    private let popularityLabel: UILabel = {
        let label = UILabel()
        label.text = "Popularity"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()
    
    private let popularity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.sizeToFit()
        return label
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8
        )
        return stackView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
        ])
                
        setImageConstraints()
        stackView.addArrangedSubview(movieImage)
        
        infoStackView.addArrangedSubview(overviewLabel)
        infoStackView.addArrangedSubview(overview)
        infoStackView.addArrangedSubview(popularityLabel)
        infoStackView.addArrangedSubview(popularity)
        stackView.addArrangedSubview(infoStackView)
    }
    
    func configureWith(movie: Movie){
        overview.text = movie.overview
        popularity.text = "\(movie.popularity)"
        downloadImage(movie: movie)
    }
    
    func setImageConstraints(){
        let imageViewHeightConstraint = NSLayoutConstraint(item: movieImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        movieImage.addConstraint(imageViewHeightConstraint)
    }
    
    func downloadImage(movie: Movie){
        let url = URL(string: "\(Networking().preferences?.baseUrlImage ?? "")\(movie.posterPath)")
        movieImage.kf.setImage(with: url)
        
        movieImage.kf.indicatorType = .activity
        movieImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "movie-placeholder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
