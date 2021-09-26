//
//  DeviceModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation

struct DeviceModel: Identifiable {
    let id: String = UUID().uuidString
    let titl: String
    let  detail: String
}
