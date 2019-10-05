//
//  NetworkManagerTests.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import XCTest

@testable import HeroTest

class NetworkManagerTests: XCTestCase {
    
    var subject: NetworkManaging!
    var mockSession: MockURLSession!
    
    let request = URLRequest(url: URL(string: "Test")!)
    let mockData = Data([0,1,0,1])
    
    override func setUp() {
        mockSession = MockURLSession()
        subject = NetworkManager(session: mockSession)
    }
    
    override func tearDown() {
        subject = nil
    }

    func test_NetworkManagerFetchCalled_StartsARequest() {
        let dataTask = subject.fetch(request: request) { (_, _, _) in }
        XCTAssertTrue((dataTask as! MockURLSessionDataTask).resumeCalled)
    }
    
    func test_NetworkManagerFetchCalled_DataReceived_CallsCompletionWithData() {
        mockSession.data = mockData
        
        var result: Data?
        subject.fetch(request: request) { (data, _, _) in
            result = data
        }
        XCTAssertEqual(result, mockData)
    }
    
    func test_NetworkManagerFetchCalled_DataReceived_CallsCompletionWithDataOnMainThread() {
        mockSession.data = mockData
        
        var result: Data?
        subject.fetch(request: request) { (data, _, _) in
            result = data
        }
        XCTAssertEqual(result, mockData)
    }
    
    
    func test_NetworkManagerFetchCalled_NoDataReceived_CallsCompletionWithNil() {
        mockSession.data = nil
        
        var result: Data? = mockData
        subject.fetch(request: request) { (data, _, _) in
            result = data
        }
        XCTAssertNil(result)
    }
}
