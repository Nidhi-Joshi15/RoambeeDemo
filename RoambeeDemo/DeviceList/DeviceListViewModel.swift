//
//  DeviceListViewModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit


final class DeviceListViewModel {
    
    var dataList: [String]?
    var service: APIService = APIService()
    var didLoad: (() -> Void)?
    var deviceDiscovery: BluetoothDeviceDiscovery = (UIApplication.shared.delegate as! AppDelegate).deviceDiscovery
    var failToLoad: ((String?) -> Void)?
    
    private var deviceName = UIDevice.current.name {
        didSet { deviceDiscovery.deviceName = deviceName }
    }
    
    init() {
        fetchData()
    }
    func getList(_ index: Int) -> String? {
        return index < dataList?.count ?? 0 ? dataList?[index] : nil
    }
    
    func getListCount() -> Int {
        return dataList?.count ?? 0
    }
    
    func fetchData() {
        deviceDiscovery.devicesListUpdatedHandler = { [weak self] in
            self?.dataList = self?.deviceDiscovery.devices.map({$0.name})
            self?.didLoad?()
    }
    }
}
protocol DeviceListViewModelProtocol {
    var didLoad: (() -> Void)? {get set}
    var failToLoad: ((String?) -> Void)? {get set}
    
    func getList(_ index: Int) -> String?
    func getListCount() -> Int
    func fetchData()
}

   

