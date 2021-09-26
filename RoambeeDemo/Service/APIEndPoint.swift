//
//  APIEndPoint.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//


import Foundation
struct API {
    
    static let baseUrl = "https://my-json-server.typicode.com/Dhaval3110/locationAPI/db"
}

class APIEndPoint {
    
    var baseUrl: String {
        return API.baseUrl
    }
    
    var params: String {
        return ""
    }
        
    var httpMethod: HttpMethod {
        return .get
    }
    
    var url : String {
        return baseUrl
    }
}

enum HttpMethod :String {
    case post = "POST"
    case get = "GET"
}
