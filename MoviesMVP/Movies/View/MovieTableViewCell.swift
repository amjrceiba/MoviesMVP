//
//  MovieTableViewCell.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let movieTitle: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for:.vertical)
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.sizeToFit()
        return label
    }()
    
    private let moviePopularity: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.vertical)
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 12)
        label.sizeToFit()
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8
        )
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8
        )
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        verticalStackView.addArrangedSubview(movieTitle)
        verticalStackView.addArrangedSubview(moviePopularity)
        verticalStackView.addArrangedSubview(UIView())
        setImageConstraints()
        
        horizontalStackView.addArrangedSubview(movieImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageConstraints(){
        let imageViewWidthConstraint = NSLayoutConstraint(item: movieImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        let imageViewHeightConstraint = NSLayoutConstraint(item: movieImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        movieImage.addConstraints([imageViewWidthConstraint, imageViewHeightConstraint])
    }
    
    func configureWith(movie: Movie){
        movieTitle.text = movie.originalTitle
        moviePopularity.text = "Popularity: \(movie.popularity)"
        downloadImage(movie: movie)
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
}
