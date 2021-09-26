//
//  DataModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//
import Foundation

class ResponseData: Codable {
    let data: [DataModel]
}
class DataModel: Codable {
    let name: String
    let details: String
    let location: Location
    
    init(dataName: String, dataDetail: String, dataLocation: Location) {
        name = dataName
        details = dataDetail
        location = dataLocation
    }
}

protocol DataModelProtocol {
    var dataTitle: String {get}
    var dataDetail: String {get}
}

extension DataModel: DataModelProtocol {
    var dataTitle: String {
        return name
    }
    
    var dataDetail: String {
        return details
    }
}

class Location: Codable {
    let lat: Double
    let lng: Double
    
    init(latitude: Double, longitude: Double) {
        lat = latitude
        lng = longitude
    }
}

/*

{
  "data": [
    {
      "name": "Kankaria Lake",
      "details": "Manmade lake from the 1500s, with amusement rides, adrenaline attractions & parks lining its shores.",
      "location": {
        "lat": 23.0062151,
        "lng": 72.5989987
      }
    },
    {
      "name": "Alpha One Mall",
      "details": "261, Sarkari Vasahat Road, Vastrapur, Ahmedabad, Gujarat 380006",
      "location": {
        "lat": 23.0400705,
        "lng": 72.5292933
      }
    },
    {
      "name": "Vastrapur Lake",
      "details": "261Vastrapur is an area in Ahmedabad district in the Indian state of Gujarat. The Indian Institute of Management Ahmedabad is located in this area.",
      "location": {
        "lat": 23.0367453,
        "lng": 72.5218823
      }
    }
  ]
}
*/
