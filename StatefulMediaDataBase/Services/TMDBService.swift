//
//  TMDBService.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation

struct TMDBService {
    private let networkService = APIService()
    
    func getNowPlaying(completion: @escaping (Result<MovieList, NetworkError>) -> Void) {
        guard let url = MovieHomePageEndpoint.nowPlaying.fullURL else {
            completion(.failure(.badURL))
            return
        }
        networkService.perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                do {
                    let list = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(list))
                } catch {
                    completion(.failure(.errorDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
    func getList(for endpoint: MovieHomePageEndpoint, completion: @escaping (Result<MovieList, NetworkError>) -> Void) {
        guard let url = endpoint.fullURL else {
            completion(.failure(.badURL))
            return
        }
        networkService.perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                do {
                    let list = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(list))
                } catch {
                    completion(.failure(.errorDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
