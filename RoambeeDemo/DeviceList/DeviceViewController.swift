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
    private var deviceName = UIDevice.current.name {
        didSet { deviceDiscovery.deviceName = deviceName }
    }
    
    var viewModel: DeviceListViewModel!
    var coordinator: DeviceListCoordinator?
    var deviceDiscovery: BluetoothDeviceDiscovery = (UIApplication.shared.delegate as! AppDelegate).deviceDiscovery
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        deviceDiscovery.devicesListUpdatedHandler = { [weak self] in
            
            print(self?.deviceDiscovery.devices)
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
//        let name = bluetoothManager?.peripherals
        cell.textLabel?.text = "1"
        return cell
    }
  
}
