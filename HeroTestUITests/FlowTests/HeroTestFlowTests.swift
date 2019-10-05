//
//  HeroTestFlowTests.swift
//  HeroTestFlowTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import XCTest

class HeroTestFlowTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        UIFactory.app.launch()
    }

    func test_FlowToItemDetails() {
        XCTAssertTrue(ListItemView.tableView.exists)
        XCTAssertTrue(ListItemView.sortButton.exists)
        
        // MARK: - THIS IS REALLY BAD, WITH MORE TIME PROPER STUBBING MUST
        //         BE DONE TO MOCK A NETWROK RESPONSE FOR UI TESTING.
        sleep(5)
        
        XCTAssertTrue(ListItemView.tableViewCell.exists)
        XCTAssertTrue(ListItemView.firstCell.exists)
        ListItemView.firstCell.tap()
        
        XCTAssertTrue(ItemDetailView.imageView.exists)
        XCTAssertTrue(ItemDetailView.displayTextView.exists)
    }

}
