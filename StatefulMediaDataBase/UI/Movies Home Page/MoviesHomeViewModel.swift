//
//  MoviesHomeViewModel.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation

protocol MoviesHomeViewModelDelegate: AnyObject {
    func updateViews()
}

class MoviesHomeViewModel {
    
    private let service = TMDBService()
    private var taskGroup: DispatchGroup?
    private weak var delegate: MoviesHomeViewModelDelegate?
    var sections: [MovieList] = []
    
    init(delegate: MoviesHomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchData() {
        /// Enter the group before each service call.
//        taskGroup.enter()
//        service.getNowPlaying() { [weak self] result in
//            switch result {
//            case .success(let list):
//                self?.sections.append(list)
//            case .failure(let error):
//                print(error)
//            }
//            /// Leave the group at the conclusion of the task.
//            self?.taskGroup.leave()
//            /// Remember to add `.enter()` and `.leave()` before and inside each service call.
//        }
        
        /// To iterate easily through all calls, make the endpoint `CaseIterable`
        self.taskGroup = DispatchGroup()
        MovieHomePageEndpoint.allCases.forEach { endpoint in
            taskGroup?.enter()
            service.getList(for: endpoint) { [weak self] result in
                switch result {
                case .success(var list):
                    list.title = endpoint.headerTitle
                    self?.sections.append(list)
                case .failure(let error):
                    print(error)
                }
                /// Leave the group at the conclusion of the task.
                self?.taskGroup?.leave()
                /// Remember to add `.enter()` and `.leave()` before and inside each service call.
            }
        }
        
        taskGroup?.notify(queue: .main) {
            self.delegate?.updateViews()
            self.taskGroup = nil
        }
    }
}
