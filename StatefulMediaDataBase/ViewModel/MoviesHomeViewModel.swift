//
//  MoviesHomeViewModel.swift
//  StatefulMediaDataBase
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

protocol MovieHomeViewModelDelegate: AnyObject {
    func updateViews()
}

class MoviesHomeViewModel {
    
    private let service = TMDBService()
    private let taskGroup = DispatchGroup()
    private let delegate: MovieHomeViewModelDelegate
    var sections: [MovieList] = []
    
    init(delegate: MovieHomeViewModelDelegate) {
        self.delegate = delegate
        fetchData()
    }
    
    func fetchData() {
        taskGroup.enter()
            // You will need to call all your methods to get data.
            service.getNowPlaying() { [weak self] result in
                switch result {
                case .success(let list):
                    self?.sections.append(list)
                case .failure(let error):
                    print("There has been an error", error.localizedDescription)
                // handle your error
                }
                self?.taskGroup.leave()
            }
        self.taskGroup.enter()
        service.getPopular() {
            [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print("There has been an error", error.localizedDescription)
                // handle your error
            }
            self?.taskGroup.leave()
        }
        self.taskGroup.enter()
        service.getTopRated() {
            [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print("There has been an error", error.localizedDescription)
                // handle your error
            }
            self?.taskGroup.leave()
        }
        self.taskGroup.enter()
        service.getTopRated() {
            [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print("There has been an error", error.localizedDescription)
                // handle your error
            }
            self?.taskGroup.leave()
        }
        taskGroup.notify(queue:.main) {
            self.delegate.updateViews()
        }
    }
}// End of class
