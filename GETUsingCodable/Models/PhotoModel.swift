//
//  PhotoModel.swift
//  GETUsingCodable
//
//  Created by admin on 18/05/1443 AH.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id : Int
    let title: String
    let url: String
    let thumbnailUrl: String
}


