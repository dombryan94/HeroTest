//
//  RootCoordinator.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import UIKit

protocol ItemNavigationDelegate: class {
    func detailView(with item: Item)
}

class RootCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let dataKickService = DataKickService()
        let viewModel = ItemsListViewModel(dataKickService: dataKickService)
        let viewController = ItemsListViewController(viewModel: viewModel)
        viewController.navigationDelegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension RootCoordinator: ItemNavigationDelegate {
    func detailView(with item: Item) {
        let viewModel = ItemDetailViewModel(item: item)
        let viewController = ItemDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
