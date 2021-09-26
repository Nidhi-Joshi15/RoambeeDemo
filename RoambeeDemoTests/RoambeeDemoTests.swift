//
//  RoambeeDemoTests.swift
//  RoambeeDemoTests
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import XCTest
import MapKit
import CoreLocation
@testable import RoambeeDemo

class RoambeeDemoTests: XCTestCase {

    let urlString = "https://my-json-server.typicode.com/Dhaval3110/locationAPI/db"
    lazy var datalistController = DataListViewController.create(of: .main)
    lazy var deviceListController = DeviceViewController.create(of: .main)
    lazy var dataMapController = DataMapViewController.create(of: .main)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCallToServer() {
        let session: URLSession = URLSession(configuration: .default)
        
        let url = URL(string: urlString)
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = session.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 30)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    func testController() {
        let screen: Screens = Screens()
        let deviceController = screen.createFirstViewController()
        let dataController = screen.createSecondViewController()
        let mapController = screen.createDataMapViewController(lat: 0, lng: 0)
        
    
        
        XCTAssertNotNil(deviceController)
        XCTAssertNotNil(dataController)
        XCTAssertNotNil(mapController)
    }

    func testValidHost() {
        let expected = expectation(description: "Check valid host")
        if Reachability.isConnectedToNetwork() {
            expected.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSearchViewModel() {
        let viewModel = DataListViewModel()
        viewModel.dataList = [DataModel(dataName: "DataTitle", dataDetail: "DataDetail", dataLocation: Location(latitude: 23.45232, longitude: 32.1231))]
        
        XCTAssertNotNil(viewModel.getListCount())
        XCTAssertNotNil(viewModel.getList(0))
        
    }
    
    func testShowMapData() {
        dataMapController.viewModel?.latitude = 23.5656
        dataMapController.viewModel?.longitude = 23.23424
        dataMapController.showMapData()
        
        XCTAssertNotNil(dataMapController.objectAnnotation.title)
    }
    func testDataListCoordinator() {
        let screen = Screens()
        let presenter = UINavigationController()
        datalistController.coordinator = DataListCoordinator(presenter: presenter, screens: screen)
        datalistController.coordinator?.start()
        datalistController.coordinator?.moveToSecondView(latitude: 23.2332423, longitude: 43.2323)
        
        let presenterCount: Int = datalistController.coordinator?.getPresetnterCount() ?? 0
        XCTAssertGreaterThan(presenterCount, 0)
        
    }
}
