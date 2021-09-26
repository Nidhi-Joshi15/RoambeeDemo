//
//  DeviceListViewModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation

final class DeviceListViewModel {
    
    var dataList: [DeviceModel]?
    var service: APIService = APIService()
    var didLoad: (() -> Void)?
    
    var failToLoad: ((String?) -> Void)?
    
    init() {
        fetchData()
    }
    func getList(_ index: Int) -> DeviceModel? {
        return index < dataList?.count ?? 0 ? dataList?[index] : nil
    }
    
    func getListCount() -> Int {
        return dataList?.count ?? 0
    }
    
    func fetchData() {
        
    }
}
protocol DeviceListViewModelProtocol {
    var didLoad: (() -> Void)? {get set}
    var failToLoad: ((String?) -> Void)? {get set}
    
    func getList(_ index: Int) -> DeviceModel?
    func getListCount() -> Int
    func fetchData()
}

   

