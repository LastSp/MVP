//
//  NetworkService.swift
//  MVP
//
//  Created by Андрей Колесников on 30.09.2021.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
             
                do {
                    let obj = try JSONDecoder().decode([Comment].self, from: data!)
                    completion(.success(obj))
                } catch  {
                    completion(.failure(error))
                }
            
            
        }.resume()
        
    }
}
 
