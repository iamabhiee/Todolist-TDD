//
//  ToDoItemTests.swift
//  TodoList
//
//  Created by Abhishek Sheth on 13/08/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import XCTest
@testable import TodoList

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldTakeTitle() {
        let item = ToDoItem(title : "Test title")
        XCTAssertEqual(item.title, "Test title", "Initializer should set the item title")
    }
    
    func testInit_ShouldTakeTitleAndDescription() {
        let item = ToDoItem(title : "Test title", itemDescription : "Test description")
        XCTAssertEqual(item.itemDescription, "Test description", "Initializer should set the item description")
    }
    
    func testInit_ShouldTakeTitleDescriptionAndTimestamp() {
        let item = ToDoItem(title : "Test title", itemDescription : "Test description", timestamp : 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "Initializer should set the item timestamp")
    }
    
    func testInit_ShouldTakeTitleDescriptionTimestampAndLocation() {
        let location = Location(name : "Test name")
        
        let item = ToDoItem(title : "Test title", itemDescription : "Test description", timestamp : 0.0, location : location)
        XCTAssertEqual(location.name, item.location?.name, "Initializer should set the item location")
    }
}
