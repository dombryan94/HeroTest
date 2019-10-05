//
//  MockNetworkManager.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

@testable import HeroTest

class MockNetworkManager: NetworkManaging {
    
    var data: Data?
    var error: Error?
    
    var fetchCalled: Bool = false
    func fetch(request: URLRequest, completion: @escaping ServiceCompletion) -> URLSessionDataTaskProtocol {
        fetchCalled = true
        
        let data = self.data
        let error = self.error
        
        let dataTask = MockURLSessionDataTask {
            completion(data, nil, error)
        }
        dataTask.resume()
        return dataTask
    }
}
