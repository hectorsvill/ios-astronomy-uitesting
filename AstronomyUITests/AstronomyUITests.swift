//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Hector Steven on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
		let app = XCUIApplication()
		app.launchArguments = ["UITesting"]
		app.launch()
    }

	func testNextSol() {
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 2))
		nextSolButton.tap()

		XCTAssert(title["Sol 16"].waitForExistence(timeout: 2))
	}
	
	func testPreviouseSol() {
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 2))
		nextSolButton.tap()

		XCTAssert(title["Sol 16"].waitForExistence(timeout: 2))
		previousSolButton.tap()
		
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 5))
	}
	
	func testPhotoCellId0() {
		cell0.tap()
		XCTAssert(title["725"].waitForExistence(timeout: 2))
	}
	
	func testSwipeDownSelectCell22(){
		app.swipeUp()
		app.swipeUp()
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 1))
		
		cell22.tap()
		XCTAssert(title["58811"].waitForExistence(timeout: 1))
	}
	
	func testSelectCell0WithBackButton() {
		testPhotoCellId0()
		
		XCTAssertTrue(photoImageView.exists)

		XCTAssertTrue(sol5BackButton.exists)
		sol5BackButton.tap()
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 1))
	}
	
	func testSavingPhoto() {
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 1))
		app.swipeUp()
		cell18.tap()

		XCTAssert(title["12695"].waitForExistence(timeout: 1))
		//identifier: 'PhotoDetailViewController.SaveButton', label: 'Save t
		
		XCTAssertTrue(saveButton.exists)
		saveButton.tap()
		
		XCTAssertTrue(saveOkLabel.exists)
		saveOkLabel.tap()
		XCTAssert(title["12695"].waitForExistence(timeout: 1))
	}

	
	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	var nextSolButton: XCUIElement {
		return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
	}
	
	var previousSolButton: XCUIElement {
		return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
	}
	
	var title: XCUIElementQuery {
		return app.otherElements
	}
	
	var cell22: XCUIElement {
		return self.app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 22"]
	}
	
	var cell0: XCUIElement {
		return app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 0"]
	}
	
	var cell18: XCUIElement {
		return app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 18"]
	}
	
	var saveOkLabel: XCUIElement {
		return app.buttons["SaveOkay Label"]
	}
	
	var saveButton: XCUIElement {
		return app.buttons["PhotoDetailViewController.SaveButton"]
	}
	
	var sol5BackButton: XCUIElement {
		return app.navigationBars.buttons["Sol 15"]
	}
	
	var photoImageView: XCUIElement {
		return app.images["PhotoDetailViewController.ImageView"]
	}
}
