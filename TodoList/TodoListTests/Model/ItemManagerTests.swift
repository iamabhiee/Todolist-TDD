//
//  ItemManagerTests.swift
//  TodoList
//
//  Created by Abhishek Sheth on 13/08/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import XCTest
@testable import TodoList

class ItemManagerTests: XCTestCase {

    var sut : ItemManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testToDoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.toDoCount, 0, "Initially toDo count should be 0")
    }
    
    func testDoneCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.doneCount, 0, "Initially done count should be 0")
    }
    
    func testToDoCount_AfterAddingOneItem_ShouldBeOne() {
        let todoItem = ToDoItem(title: "Test title")
        sut.addItem(todoItem)
        XCTAssertEqual(sut.toDoCount, 1, "ToDo count should be 1")
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = ToDoItem(title: "Title")
        sut.addItem(item)
        
        let addedItem = sut.itemAtIndex(0)
        XCTAssertEqual(addedItem.title, item.title, "should be the same items")
    }
    
    func testCheckItem_ShouldChangeCountOfToDoAndDoneItems() {
        let item = ToDoItem(title: "First Item")
        sut.addItem(item)
        
        sut.checkItemAtIndex(0)
        XCTAssertEqual(sut.toDoCount, 0, "should be 0")
        XCTAssertEqual(sut.doneCount, 1, "should be 1")
    }
    
    func testCheckingItem_ShouldRemoveFromToDoList() {
        let firstItme = ToDoItem(title: "First Item")
        sut.addItem(firstItme)
        
        let secondItem = ToDoItem(title: "Second Item")
        sut.addItem(secondItem)
        
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, secondItem.title, "should be the same item")
    }
    
    func testDoneItem_ShouldReturnPreviouslyCheckedItem() {
        let item = ToDoItem(title: "Item")
        sut.addItem(item)
        sut.checkItemAtIndex(0)
        
        let returnedItem = sut.doneItemAtIndex(0)
        
        XCTAssertEqual(returnedItem.title, item.title, "should be the same item")
    }
    
    func testRemoveAllItems_ShouldResultCountsAsZero() {
        let firstItme = ToDoItem(title: "First Item")
        sut.addItem(firstItme)
        
        let secondItem = ToDoItem(title: "Second Item")
        sut.addItem(secondItem)
        
        sut.checkItemAtIndex(0)
        XCTAssertEqual(sut.toDoCount, 1, "todo count should be 1")
        XCTAssertEqual(sut.doneCount, 1, "done should be 1")
        
        sut.removeAllItems()
        XCTAssertEqual(sut.toDoCount, 0, "todo count should be 0")
        XCTAssertEqual(sut.doneCount, 0, "done should be 0")
    }
    
    func testToDoCount_AfterAddingSameItemTwice_ShouldBeOne() {
        let firstItem = ToDoItem(title: "Test title")
        sut.addItem(firstItem)
        
        let secondItem = ToDoItem(title: "Test title")
        sut.addItem(secondItem)
        
        XCTAssertEqual(sut.toDoCount, 1, "ToDo count should be 1")
    }
}
