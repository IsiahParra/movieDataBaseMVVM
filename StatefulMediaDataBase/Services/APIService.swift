//
//  APIService.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation

struct APIService {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                 completion(.failure(.requestError(error)))
             }
             if let response = response as? HTTPURLResponse {
                 print("\(response.statusCode)")
             }
             guard let data = data else {
                 completion(.failure(.couldNotUnwrap))
                 return
             }
             completion(.success(data))
        }.resume()
    }
}
