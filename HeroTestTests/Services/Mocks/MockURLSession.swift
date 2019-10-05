//
//  MockURLSession.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

@testable import HeroTest

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var error: Error?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        let data = self.data
        let error = self.error
        
        return MockURLSessionDataTask(closure: {
            completionHandler(data, nil, error)
        })
    }
}
