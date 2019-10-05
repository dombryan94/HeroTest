//
//  ItemsListViewModel.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

protocol ItemsListViewModelable {
    var items: Items? { get }
    
    func fetchItems(updateWith completion: @escaping (ItemsTableViewState) -> Void)
    func sortItems()
}


enum ItemsTableViewState {
    case loading
    case loaded
    case failed
}

class ItemsListViewModel: ItemsListViewModelable {
    var items: Items?
    
    private let dataKickService: DataKickServicable
    
    init(dataKickService: DataKickServicable) {
        self.dataKickService = dataKickService
    }
    
    func fetchItems(updateWith completion: @escaping (ItemsTableViewState) -> Void) {
        dataKickService.fetchItems { [weak self] result in
            switch result {
            case .success(let data):
                self?.items = data
                completion(.loaded)
            case .failure(let error):
                print(error)
                completion(.failed)
            }
        }
    }
    
    func sortItems() {
        guard let items = items else { return }
        self.items = items
            .filter { $0.name != nil }
            .sorted { $0.name! < $1.name! }
    }
}
