//
//  MoviesHomePageViewController.swift
//  StatefulMediaDataBase
//
//  Created by RYAN GREENBURG on 6/4/22.
//

import Foundation
import UIKit

class MoviesHomePageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: MoviesHomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.viewModel = MoviesHomeViewModel(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchData()
    }
}

extension MoviesHomePageViewController: MoviesHomeViewModelDelegate {
    func updateViews() {
        tableView.reloadData()
    }
}

extension MoviesHomePageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
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
}

extension MoviesHomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = viewModel.sections[section]
        let headerLabel = UILabel(frame: CGRect(x: 0,
                                                y: 0,
                                                width: Int(tableView.frame.width),
                                                height: 50))
        
        headerLabel.text = section.title
        headerLabel.backgroundColor = .secondarySystemBackground
        return headerLabel
    }
}
