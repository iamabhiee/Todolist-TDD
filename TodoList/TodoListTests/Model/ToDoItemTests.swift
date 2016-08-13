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
    
    func testEqualItems_ShouldBeEqual() {
        let firstItem = ToDoItem(title : "Title")
        let secondItem = ToDoItem(title : "Title")
        
        XCTAssertEqual(firstItem, secondItem, "should be same item")
    }
    
    func testWhenLocationDifferences_ShouldNotBeEqual() {
        let firstItem = ToDoItem(title : "Title", itemDescription: "Description", timestamp: 0.0, location: Location(name: "Home"))
        let secondItem = ToDoItem(title : "Title", itemDescription: "Description", timestamp: 0.0, location: Location(name: "Office"))
        
        XCTAssertNotEqual(firstItem, secondItem, "should not be same item")
    }
    
    func testWhenTitleDifferences_ShouldNotBeEqual() {
        let firstItem = ToDoItem(title : "First Title")
        let secondItem = ToDoItem(title : "Second Title")
        
        XCTAssertNotEqual(firstItem, secondItem, "should not be same item")
    }
    
    func testWhenDescriptionDifferences_ShouldNotBeEqual() {
        let firstItem = ToDoItem(title : "Title", itemDescription: "First Description")
        let secondItem = ToDoItem(title : "Title", itemDescription: "Second Description")
        
        XCTAssertNotEqual(firstItem, secondItem, "should not be same item")
    }
    
    func testWhenTimestampDifferences_ShouldNotBeEqual() {
        let firstItem = ToDoItem(title : "Title", itemDescription: "Description", timestamp: 0.0)
        let secondItem = ToDoItem(title : "Title", itemDescription: "Description", timestamp: 1.0)
        
        XCTAssertNotEqual(firstItem, secondItem, "should not be same item")
    }
}
