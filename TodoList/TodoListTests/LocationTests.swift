//
//  LocationTests.swift
//  TodoList
//
//  Created by Abhishek Sheth on 13/08/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import XCTest
@testable import TodoList
import CoreLocation

class LocationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldSetName() {
        let location = Location(name : "Test name")
        
        XCTAssertEqual(location.name, "Test name", "Initializer should set the location name")
    }
    
    func testInit_ShouldSetNameAndCoordinates() {
        let coordinate = CLLocationCoordinate2DMake(1.0, 2.0)
        let location = Location(name : "Test name", coordinate : coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude, "Initializer should set the latitude")
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude, "Initializer should set the longitude")
    }

}
