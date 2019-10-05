//
//  NetworkManager.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import Foundation

typealias ServiceCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkManaging {
    @discardableResult func fetch(request: URLRequest, completion: @escaping ServiceCompletion) -> URLSessionDataTaskProtocol
}

class NetworkManager: NetworkManaging {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    @discardableResult func fetch(request: URLRequest, completion: @escaping ServiceCompletion) -> URLSessionDataTaskProtocol {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            self.log(data, response, error)
            completion(data, response, error)
        }
        dataTask.resume()
        return dataTask
    }
    
    func log(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        print("--- Network Responded---")
        print("  Data: \(String(describing: data))")
        print("  Reponse: \(String(describing: response?.url))")
        print("  Error: \(String(describing: error))")
    }
}
