//
//  Movie.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation

struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
    }
    
    let title: String
    let overview: String?
    let posterPath: String?
}
