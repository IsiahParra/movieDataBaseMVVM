//
//  MovieList.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation

struct MovieList: Decodable {
    private enum CodingKeys: String, CodingKey {
        case results
    }
    
    let results: [Movie]
    var title: String?
}
