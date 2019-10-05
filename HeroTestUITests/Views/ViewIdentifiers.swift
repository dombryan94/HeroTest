//
//  ViewIdentifiers.swift
//  HeroTestUITests
//
//  Created by Bryan, Dominic (D.) on 05/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import XCTest

struct UIFactory {
    static let app = XCUIApplication()
}

struct ListItemView {
    static let tableView = UIFactory.app.tables["itemListTableView"]
    static let tableViewCell = UIFactory.app.cells["ListItemTableViewCell"]
    static let firstCell = UIFactory.app.cells.element(boundBy: 0)
    static let sortButton = UIFactory.app.navigationBars.buttons["sortButton"]
}

struct ItemDetailView {
    static let imageView = UIFactory.app.images["imageView"]
    static let displayTextView = UIFactory.app.textViews["textView"]
}
