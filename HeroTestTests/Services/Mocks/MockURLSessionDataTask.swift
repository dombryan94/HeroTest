//
//  MockURLSessionDataTask.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

@testable import HeroTest

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    var resumeCalled: Bool = false
    func resume() {
        resumeCalled = true
        closure()
    }
}
