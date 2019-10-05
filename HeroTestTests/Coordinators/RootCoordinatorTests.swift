//
//  RootCoordinatorTests.swift
//  HeroTestTests
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import XCTest

@testable import HeroTest

class RootCoordinatorTesta: XCTestCase {
    
    var subject: RootCoordinator!
    var navigationController: UINavigationController!
    
    override func setUp() {
        navigationController = UINavigationController()
        subject = RootCoordinator(navigationController)
    }
    
    func test_Start_PresentsItemsListViewController() {
        subject.start()
        let viewController = navigationController.topViewController as? ItemsListViewController
        XCTAssertNotNil(viewController)
    }
}
