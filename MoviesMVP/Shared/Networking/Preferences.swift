//
//  Preferences.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 17/06/21.
//

import Foundation

struct Preferences: Codable {
    let baseUrl: String
    let apiKey: String
    let discover: String
    let baseUrlImage: String
}
