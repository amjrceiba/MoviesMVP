//
//  MoviesView.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import UIKit

class MoviesView: UIView {
    
    let tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableview.topAnchor.constraint(equalTo: topAnchor),
            tableview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
