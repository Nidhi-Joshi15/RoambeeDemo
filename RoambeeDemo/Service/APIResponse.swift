//
//  APIResponse.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
struct APIResponse {
    
    let data: Data
    var statusCode:Int = -100
    
    init(data: Data) {
        self.data = data
    }
    
    func getModel<T:Codable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self.data)
    }
}
