//
//  BluetoothMaster.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import CoreBluetooth

/// A service that both advertises this current device,
/// and scans for other devices also performing the same advertisement
/// over Bluetooth.
class BluetoothDeviceDiscovery: NSObject {

    // MARK: - Public Members -

    /// The name of this device that will be advertised to others
    public var deviceName = "Demo" {
        didSet { startAdvertising() }
    }

    /// A list of devices that have been discovered by this device
    private(set) public var devices = [Device]()

    /// A closure that is called whenever the list of devices is updated
    public var devicesListUpdatedHandler: (() -> Void)?

    // MARK: - Private Members -

    // The central manager scans for other devices advertising themselves
    private var centralManager: CBCentralManager!

    // The peripheral manager handles advertising this device to other devices
    private var peripheralManager: CBPeripheralManager!

    // Make a queue we can run all of the events off
    
    private let queue = DispatchQueue.main
//    private let queue = DispatchQueue(label: "live.demo.bluetooth-discovery",
//                                      qos: .background, attributes: .concurrent,
//                                      autoreleaseFrequency: .workItem, target: nil)

    /// Create a new instance of this discovery class.
    /// Will start scanning and advertising immediately
    init(deviceName: String? = nil) {
        super.init()

        // Create the Bluetooth devices (Which will immediately start warming them up)
        self.centralManager = CBCentralManager(delegate: self, queue: queue)
        self.peripheralManager = CBPeripheralManager(delegate: self, queue: queue)

        // If a device name is provided, capture it
        if let deviceName = deviceName { self.deviceName = deviceName }
    }

    // Start advertising (Or re-advertise) this device as a peipheral
    fileprivate func startAdvertising() {
        // Don't start until we've finished warming up
        guard peripheralManager.state == .poweredOn else { return }

        // Stop advertising if we're already in progress
        if peripheralManager.isAdvertising { peripheralManager.stopAdvertising() }

        // Start advertising with this device's name
//        peripheralManager.startAdvertising(
//            [CBAdvertisementDataServiceUUIDsKey: [BluetoothConstants.chatDiscoveryServiceID],
//             CBAdvertisementDataLocalNameKey: deviceName])
    }

    // If a new device is discovered by the central manager, update the visible list
    fileprivate func updateDeviceList(with device: Device) {
        // If a device already exists in the list, replace it with this new device
        if let index = devices.firstIndex(where: { $0.peripheral.identifier == device.peripheral.identifier }) {
            guard devices[index].name != device.name else { return }
            devices.remove(at: index)
            devices.insert(device, at: index)
            devicesListUpdatedHandler?()
            return
        }

        // If this item didn't exist in the list, append it to the end
        devices.append(device)
        devicesListUpdatedHandler?()
    }
}

extension BluetoothDeviceDiscovery: CBCentralManagerDelegate {
    // Called when the Bluetooth central state changes
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard central.state == .poweredOn else { return }

        // Start scanning for peripherals
        centralManager.scanForPeripherals(withServices: [BluetoothConstants.chatDiscoveryServiceID],
                                          options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
    }

    // Called when a peripheral is detected
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String: Any], rssi RSSI: NSNumber) {
        // Get the string value of the UUID of this device as the default value
        var name = peripheral.identifier.description

        // Attempt to get the user-set device name of this peripheral
        if let deviceName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            name = deviceName
        }

        // Capture all of this in a device object
        let device = Device(peripheral: peripheral, name: name)

        // Add or update this object to the visible list
        DispatchQueue.main.async { [weak self] in
            self?.updateDeviceList(with: device)
        }
    }
    func centralManager(_ central: CBCentralManager, connectionEventDidOccur event: CBConnectionEvent, for peripheral: CBPeripheral) {
        print("connection")
    }
    func retrievePeripherals(withIdentifiers identifiers: [UUID]) -> [CBPeripheral] {
        print(identifiers)
        return []
    }
    
}

extension BluetoothDeviceDiscovery: CBPeripheralManagerDelegate {
    // Called when the Bluetooth peripheral state changes
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        guard peripheral.state == .poweredOn else { return }

        // Start advertising this device as a peripheral
        startAdvertising()
    }
}


struct BluetoothConstants {

    /// Bluetooth peripherals advertise their supported capabilities as uniquely identified services
    /// This service is used when a device is advertising itself to be available to other devices
    static let chatDiscoveryServiceID = CBUUID(string: "42332fe8-9915-11ea-bb37-0242ac130002")

    /// Once two devices have decided they will initiate a chat session, this service is used
    /// in place of the discovery service, so these two devices can identify each other
    static let chatServiceID = CBUUID(string: "43eb0d29-4188-4c84-b1e8-73231e02af95")

    /// Bluetooth services contain a number of characteristics, that represent a number
    /// of specific functions of a service. For our example, our chat service will contain
    /// a characteristic that is used to move data between devices.
    static let chatCharacteristicID = CBUUID(string: "f0ab5a15-b003-4653-a248-73fd504c128f")
}
