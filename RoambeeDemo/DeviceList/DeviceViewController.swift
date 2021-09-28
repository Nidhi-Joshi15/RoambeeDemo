//
//  DeviceViewController.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit

class DeviceViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var deviceListtableView: UITableView?
    
    
    // MARK: - Properties
    
    
    var viewModel: DeviceListViewModel!
    var coordinator: DeviceListCoordinator?
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        viewModel.didLoad = { [weak self] in
            self?.deviceListtableView?.reloadData()
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
extension DeviceViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if viewModel.getListCount() == 0 {
                self.deviceListtableView?.setEmptyMessage("Scanning nearby devices...")
            } else {
                self.deviceListtableView?.restore()
            }
        return viewModel.getListCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getList(indexPath.row)
        return cell
    }
  
}
