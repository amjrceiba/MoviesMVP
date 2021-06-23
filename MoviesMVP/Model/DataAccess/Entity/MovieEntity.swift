//
//  MovieEntity.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 16/06/21.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdropPath: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var originalTitle = "", overview: String = ""
    @objc dynamic var popularity: Double = Double(0)
    @objc dynamic var posterPath = "", releaseDate = "", title: String = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: Double = Double(0)
    @objc dynamic var voteCount: Int = 0
}
