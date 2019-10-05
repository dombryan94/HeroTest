//
//  DataKickServiceTests.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import XCTest

@testable import HeroTest

class DataKickServiceTests: XCTestCase {
    
    var subject: DataKickService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        mockNetworkManager = MockNetworkManager()
        subject = DataKickService(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        subject = nil
    }
    
    func test_FetchItemsSucceeds_ReturnsItems() {
        let data = DataKickServiceTests.mockData
        
        mockNetworkManager.data = data
        var result: Result<Items, ItemServiceError>?
        var itemServiceError: ItemServiceError?
        let expectation = XCTestExpectation(description: #function)
        subject.fetchItems { fetchedResult in
            switch fetchedResult {
            case .failure(let error):
                itemServiceError = error
            case .success(_):
                result = fetchedResult
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertNotNil(result)
        XCTAssertNil(itemServiceError)
    }
    
    func test_FetchItemsGetsIncorrectData_ThrowsDecodingError() {
        let incorrectData = Data([0,1,2,3])
        mockNetworkManager.data = incorrectData
        mockNetworkManager.error = TestError.test
        
        var result: Result<Items, ItemServiceError>?
        var itemServiceError: ItemServiceError?
        let expectation = XCTestExpectation(description: #function)
        subject.fetchItems { fetchedResult in
            switch fetchedResult {
            case .failure(let error):
                itemServiceError = error
            case .success(_):
                result = fetchedResult
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertNotNil(itemServiceError)
        XCTAssertNil(result)
    }
    
    func test_FetchItemsFails_ReturnsNil() {
        mockNetworkManager.data = nil
        mockNetworkManager.error = TestError.test
        
        var result: Result<Items, ItemServiceError>?
        var itemServiceError: ItemServiceError?
        let expectation = XCTestExpectation(description: #function)
        subject.fetchItems { fetchedResult in
            switch fetchedResult {
            case .failure(let error):
                itemServiceError = error
            case .success(_):
                result = fetchedResult
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertNotNil(itemServiceError)
        XCTAssertNil(result)
    }
    
    
}

enum TestError: Error {
    case test
}

extension DataKickServiceTests {
    static var mockData: Data {
        let bundle = Bundle(for: self)
        let path = bundle.path(forResource: "items", ofType: "json")!
        return FileManager().contents(atPath: path)!
    }
}
