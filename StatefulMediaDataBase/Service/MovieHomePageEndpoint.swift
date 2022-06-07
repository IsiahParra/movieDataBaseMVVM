//
//  MovieHomePageEndpoint.swift
//  StatefulMediaDataBase
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

enum MovieHomePageEndpoint {
    static let baseURL = URL(string: "https://api.themoviedb.org/3/movie")
    case nowPlaying
    case popular
    case topRated
    case upcoming
    // Start by declaring the computed Property
        var fullURL: URL? {
            // Unwrap your baseURL as a `var` so that you can mutate it.
            guard var url = Self.baseURL else { return nil }
            // Switch on self, self being the case of the enum, and append the correct path component to the url
            switch self {
            case .nowPlaying:
                url.appendPathComponent("now_playing")
            case .popular:
                url.appendPathComponent("popular")
            case .topRated:
                url.appendPathComponent("top_rated")
            case .upcoming:
                url.appendPathComponent("upcoming")
            }
            // Unwrap the urlComponents so you can add the api key query item
            guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
            urlComponents.queryItems = [URLQueryItem(name: "api_key", value:"73946a66bdb733e0a5e80ecd8c0bb1c0")]
            // Return the final URL
            return urlComponents.url
        }
}
