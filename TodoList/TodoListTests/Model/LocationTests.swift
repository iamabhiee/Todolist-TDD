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
    
    func testDifferentNames_ShouldNotBeEqual() {
        let firstLocation = Location(name: "Home")
        let secondLocation = Location(name: "Office")
        
        XCTAssertNotEqual(firstLocation, secondLocation, "should be same item")
    }

    func testWhenLatitudeDiffers_ShouldNotBeEqual() {
        performNotEqualTestWithLocationProperty("Home", secondName: "Home", firstLatLong: (1.0, 2.0), secondLatLong: (2.0, 2.0))
    }
    
    func testWhenLongitudeDiffers_ShouldNotBeEqual() {
        performNotEqualTestWithLocationProperty("Home", secondName: "Home", firstLatLong: (2.0, 1.0), secondLatLong: (2.0, 2.0))
    }
    
    func testWhenOneLocationHaveCoordinateAndOtherDoesnt_ShouldNotBeEqual() {
        performNotEqualTestWithLocationProperty("Home", secondName: "Home", firstLatLong: (1.0, 2.0), secondLatLong: nil)
    }
    
    func performNotEqualTestWithLocationProperty(firstName : String, secondName : String, firstLatLong : (Double, Double)?, secondLatLong : (Double, Double)?, line: UInt = #line) {
        let firstCoordinate : CLLocationCoordinate2D?
        if let firstLongLatValue = firstLatLong {
            firstCoordinate = CLLocationCoordinate2DMake(firstLongLatValue.0 , firstLongLatValue.1)
        } else  {
            firstCoordinate = nil
        }
        
        let secondCoordinate : CLLocationCoordinate2D?
        if let secondLongLatValue = secondLatLong {
            secondCoordinate = CLLocationCoordinate2DMake(secondLongLatValue.0 , secondLongLatValue.1)
        } else  {
            secondCoordinate = nil
        }
        
        let firstLocation = Location(name: firstName, coordinate: firstCoordinate)
        let secondLocation = Location(name: secondName, coordinate: secondCoordinate)
        
        XCTAssertNotEqual(firstLocation, secondLocation, "should be same item", line : line)
    }
}
