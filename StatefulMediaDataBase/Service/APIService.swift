//
//  APIService.swift
//  StatefulMediaDataBase
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

struct APIService {
    
    func perform(request: URLRequest, completion: @escaping (Result<Data,NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(.requestError(error)))
            }
            guard let data = data else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            completion(.success(data))
        }.resume()
    }
   }
/// Error Object for throwing errors on concurrent tasks
enum NetworkError: Error, LocalizedError {
    case requestError(Error)
    case badURL
    case couldNotUnwrap
    case errorDecoding(Error)
    
    var localizedDescription: String {
        switch self {
        case .requestError(let error):
            return "Error performing the task: \(error.localizedDescription)"
        case .badURL:
            return "Unable to make the request with the given URL"
        case .couldNotUnwrap:
            return "Error parsing requested data"
        case .errorDecoding:
            return "Error ecountered when decoding the data"
        }
    }
}
