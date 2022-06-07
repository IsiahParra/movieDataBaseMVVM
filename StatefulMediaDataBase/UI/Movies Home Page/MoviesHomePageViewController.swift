//
//  MoviesHomePageViewController.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation
import UIKit

class MoviesHomeViewController: UIViewController, MovieHomeViewModelDelegate {
    func updateViews() {
        print(viewModel.sections)
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: MoviesHomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MoviesHomeViewModel(delegate: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.sections[section]
        return section.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        let item = section.results[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaItemCell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        configuration.secondaryText = item.overview
        cell.contentConfiguration = configuration
        return cell
    }
    

    
}// end of class


