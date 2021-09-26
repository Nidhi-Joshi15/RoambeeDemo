//
//  DataListViewController.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit

class DataListViewController: UIViewController {
    
    // MARK: - Outlets
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var dataListTableView: UITableView?
    // MARK: - Properties
    
    var viewModel: DataListViewModel?
    var coordinator: DataListCoordinator?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        viewModel?.didLoad = { [weak self] in
            self?.dataListTableView?.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        viewModel?.fetchData()
    }
    
    func setupTableView() {
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        dataListTableView?.addSubview(refreshControl)
        
        dataListTableView?.registerNib(Constant.dataCellIdentifier)
        dataListTableView?.tableFooterView = UIView()
    }
}
extension DataListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getListCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as? DataCell
        guard let dataModel = viewModel?.getList(indexPath.row) else { return UITableViewCell() }
        cell?.loadData(data: dataModel)
        cell?.layoutIfNeeded()
        return cell ?? DataCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataModel = viewModel?.getList(indexPath.row) else { return }
        coordinator?.moveToSecondView(latitude: dataModel.location.lat, longitude: dataModel.location.lng)
    }
}
