//
//  AddEditView.uitest.swift
//  BookManager
//
//  Created by Isai Magdaleno Almeraz Landeros on 04/02/26.
//

import XCTest

class AddEdditView_UITests: XCTestCase {
	override func setUpWithError() throws {
		continueAfterFailure = false
	}
	
	func testAddBookWorks() throws {
		let app = XCUIApplication()
		app.launch()
		
		let beforeAddingBookCount = app.collectionViews.firstMatch.cells.count
		
		let addButton = app.buttons["Add book"]
		addButton.tap()
		
		// Check if save Btn is Disabled
		let saveButton = app.buttons["Save"]
		XCTAssertTrue(!saveButton.isEnabled)
		
		let titleTextField = app.textFields["Title"]
		titleTextField.tap()
		
		let newTitle = "NewBook \(beforeAddingBookCount + 1)"
		titleTextField.typeText(newTitle)
		
		let AuthorTextField = app.textFields["Author"]
		AuthorTextField.tap()
		
		let newAuthor = "NewAuthor \(beforeAddingBookCount + 1)"
		AuthorTextField.typeText(newAuthor)
		
		saveButton.tap()
		
		let afterAddingBookCount = app.collectionViews.firstMatch.cells.count
		XCTAssertEqual(afterAddingBookCount, beforeAddingBookCount + 1)
		print(afterAddingBookCount)
		
		let lastBookCellTitle = app.collectionViews.firstMatch.cells.element(boundBy: afterAddingBookCount - 1).staticTexts[newTitle].label
		XCTAssertEqual(newTitle, lastBookCellTitle)
	}
}
