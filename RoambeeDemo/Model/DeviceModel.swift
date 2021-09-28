//
//  DeviceModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation

struct DeviceModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let  detail: String
}
