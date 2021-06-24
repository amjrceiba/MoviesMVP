//
//  CartTableViewCellDelegate.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 17/06/21.
//

import Foundation

protocol CartTableViewCellDelegate: AnyObject {
    func cartTableViewCell(_ cartTableviewCell: CartTableViewCell, movie: Movie)
}
