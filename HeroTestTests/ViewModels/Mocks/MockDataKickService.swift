//
//  MockDataKickService.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

@testable import HeroTest

class MockDataKickService: DataKickServicable {
    
    var fetchItemsCalled: Bool = false
    var modelToReturn: Items?
    
    func fetchItems(completion: @escaping ItemsServiceCompletion) {
        fetchItemsCalled = true
        if let model = self.modelToReturn {
            completion(Result.success(model))
        } else {
            completion(Result.failure(.networkError("test")))
        }
    }
}
