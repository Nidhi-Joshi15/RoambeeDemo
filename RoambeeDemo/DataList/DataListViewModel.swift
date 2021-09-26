//
//  DataListViewModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation

final class DataListViewModel {
    
    
    var dataList: [DataModel]?
    var service: APIService = APIService()
    var didLoad: (() -> Void)?
    
    var failToLoad: ((String?) -> Void)?
    
    init() {
        fetchData()
    }
    func getList(_ index: Int) -> DataModel? {
        return index < dataList?.count ?? 0 ? dataList?[index] : nil
    }
    
    func getListCount() -> Int {
        return dataList?.count ?? 0
    }
    
    func fetchData() {
        service.performRequest { (response, error) in
            do {
                guard error == nil else {
                    self.failToLoad?(error?.description)
                    return
                }
                let responseData: ResponseData? = try response?.getModel()
                self.dataList = responseData?.data
                self.didLoad?()
            }
            catch let exception {
                let error = APIError(code: 101, description: exception.localizedDescription)
                self.failToLoad?(error.description)
            }
        }
    }
    
    func viewDidLoad() {
        
    }
}
protocol DataListViewModelProtocol {
    var didLoad: (() -> Void)? {get set}
    var failToLoad: ((String?) -> Void)? {get set}
    
    func getList(_ index: Int) -> DataModel?
    func getListCount() -> Int
    func fetchData()
}

   

