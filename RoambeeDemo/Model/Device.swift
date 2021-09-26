//
//  Device.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import CoreBluetooth

/// A device, as detected through
/// a Bluetooth service advertisement
struct Device {
    /// The peripheral object associated with this device
    let peripheral: CBPeripheral

    /// The reported name of this device
    let name: String

    init(peripheral: CBPeripheral, name: String = "Unknown") {
        self.peripheral = peripheral
        self.name = name
    }
}
