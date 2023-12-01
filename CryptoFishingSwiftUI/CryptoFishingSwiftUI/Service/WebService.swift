//
//  WebService.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import Foundation

class WebService {
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoModel]?, DownloaderError>) -> Void ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data) else {
                
                return completion(.failure(.parsingError))
                
            }
            
            completion(.success(currencies))
        }.resume()
        
    }
}

enum DownloaderError: Error {
    
    case badUrl
    case noData
    case parsingError
    
}
