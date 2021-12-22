//
//  FilmModel.swift
//  GETUsingCodable
//
//  Created by admin on 18/05/1443 AH.
//

import Foundation

struct Film: Codable {
    
    let results: [Result]
}

struct Result : Codable {
    let title: String
    let director: String
}
