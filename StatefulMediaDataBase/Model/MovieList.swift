//
//  MovieList.swift
//  StatefulMediaDataBase
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

struct MovieList: Codable {
    var results: [Movie] = []
}

struct Movie: Codable {
    let title: String?
    let overview: String?
    let posterPath: String?
}
