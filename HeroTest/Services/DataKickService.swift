//
//  DataKickService.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

typealias ItemsServiceCompletion = (_ result: Result<Items, ItemServiceError>) -> Void

enum ItemServiceError: Error {
    case networkError(String)
    case decodingError(String)
    case invalidURL
}

protocol DataKickServicable {
    func fetchItems(completion: @escaping ItemsServiceCompletion)
}

class DataKickService: DataKickServicable {
    
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchItems(completion: @escaping ItemsServiceCompletion) {
        guard let url = URL(string: URLs.items) else {
            completion(Result.failure(ItemServiceError.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        networkManager.fetch(request: request) { (data, response, networkError) in
            if let error = networkError {
                completion(Result.failure(ItemServiceError.networkError(String(describing: error))))
            }
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                do {
                    let model = try decoder.decode(Items.self, from: data)
                    DispatchQueue.main.async {
                        completion(Result.success(model))
                    }
                } catch let decodeError {
                    completion(Result.failure(ItemServiceError.decodingError(String(describing: decodeError))))
                }
            }
        }
    }
}
