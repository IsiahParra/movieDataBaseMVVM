//
//  TMDBService.swift
//  StatefulMediaDataBase
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

struct TMDBService {
    let networkService = APIService()
    let baseURL = "https://api.themoviedb.org/3/movie"
    
    func getNowPlaying(completion: @escaping (Result<MovieList, NetworkError>) -> Void) {
        guard let finalURL = MovieHomePageEndpoint.nowPlaying.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: finalURL )
        networkService.perform(request: request) { result in
            switch result {
            case.success(let data):
                do {
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(movieList))
                } catch {
                    print("There has been an error", error.localizedDescription)
                    completion(.failure(.errorDecoding(error)))
                }
                // Here you will decode a MovieList and complete with it
            case.failure(let error):
                // Here you will complete with the error
                completion(.failure(.requestError(error)))
            }
        }
    }
    
    
    
    func getPopular(completion: @escaping (Result<MovieList,NetworkError>) -> Void) {
        guard let finalURL = MovieHomePageEndpoint.nowPlaying.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: finalURL )
        networkService.perform(request: request) { result in
            switch result {
            case.success(let data):
                do {
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(movieList))
                } catch {
                    print("There has been an error", error.localizedDescription)
                    completion(.failure(.errorDecoding(error)))
                }
                // Here you will decode a MovieList and complete with it
            case.failure(let error):
                // Here you will complete with the error
                completion(.failure(.requestError(error)))
            }
        }
        
    }
    
    func getTopRated(completion: @escaping (Result<MovieList,NetworkError>) -> Void) {
        guard let finalURL = MovieHomePageEndpoint.nowPlaying.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: finalURL )
        networkService.perform(request: request) { result in
            switch result {
            case.success(let data):
                do {
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(movieList))
                } catch {
                    print("There has been an error", error.localizedDescription)
                    completion(.failure(.errorDecoding(error)))
                }
                // Here you will decode a MovieList and complete with it
            case.failure(let error):
                // Here you will complete with the error
                completion(.failure(.requestError(error)))
            }
        }
        
    }
    
    func getUpcoming(completion: @escaping (Result<MovieList, NetworkError>) -> Void) {
        guard let finalURL = MovieHomePageEndpoint.nowPlaying.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: finalURL )
        networkService.perform(request: request) { result in
            switch result {
            case.success(let data):
                do {
                    let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(movieList))
                } catch {
                    print("There has been an error", error.localizedDescription)
                    completion(.failure(.errorDecoding(error)))
                }
                // Here you will decode a MovieList and complete with it
            case.failure(let error):
                // Here you will complete with the error
                completion(.failure(.requestError(error)))
            }
        }
        
    }
}
