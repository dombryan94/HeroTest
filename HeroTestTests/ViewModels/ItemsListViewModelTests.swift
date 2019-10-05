//
//  ItemsListViewModelTests.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import XCTest

@testable import HeroTest

class ItemsListViewModelTests: XCTestCase {
    
    var subject: ItemsListViewModelable!
    var mockDataKickService: MockDataKickService!
    
    override func setUp() {
        mockDataKickService = MockDataKickService()
        subject = ItemsListViewModel(dataKickService: mockDataKickService)
    }
    
    override func tearDown() {
        subject = nil
    }
    
    func test_FetchItemsSucceeds_RendersLoaded() {
        var completedState: ItemsTableViewState = .loading
        
        let data = DataKickServiceTests.mockData
        let response = responseModel(for: data)
        mockDataKickService.modelToReturn = response
        
        let expectation = XCTestExpectation(description: #function)
        subject.fetchItems { state in
            completedState = state
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertTrue(mockDataKickService.fetchItemsCalled)
        XCTAssertEqual(completedState, .loaded)
    }
    
    func test_FetchItemsFails_RendersFailed() {
        var completedState: ItemsTableViewState = .loading
        
        mockDataKickService.modelToReturn = nil
        
        
        let expectation = XCTestExpectation(description: #function)
        subject.fetchItems { state in
            completedState = state
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertTrue(mockDataKickService.fetchItemsCalled)
        XCTAssertEqual(completedState, .failed)
    }
}

extension ItemsListViewModelTests {
    private func responseModel(for data: Data) -> Items {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let model = try? decoder.decode(Items.self, from: data)
        return model!
    }
}
