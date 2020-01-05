//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Lonnie Gerol on 1/5/20.
//  Copyright © 2020 Lonnie Gerol. All rights reserved.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    private init(){}
    
    //Using Swift Result type which is relativley new, see course for older version
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void){
        let endpoint = baseURL + "\(username)/followers?per_page=100page=\(page)"
        guard let url = URL(string: endpoint) else{
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if let _ = error{
                completed(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.InvalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch{
                completed(.failure(.InvalidData))
            }
            
        }
        // starts network call
        task.resume()
    }
}
