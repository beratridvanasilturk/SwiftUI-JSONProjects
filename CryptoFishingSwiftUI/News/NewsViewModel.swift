//
//  NewsViewModel.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 5.12.2023.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    private struct Returned: Codable {
        var status: String
        var totalResults: Int
        var articles: [Article]
    }
    struct Article: Codable, Hashable {
            let source : Source?
            let author : String?
            let title : String?
            let description : String?
            let url : String?
            let urlToImage : String?
            let publishedAt : String?
            let content : String?
    }
    struct Source: Codable, Hashable {
            let id : String?
            let name : String?

    }
    
    @Published var urlString = "https://newsapi.org/v2/top-headlines?country=tr&category=science&apiKey=6cbec9ebf72c48d68e9a89858a280692"
    @Published var articleArray: [Article] = []
    
    func fetchData() async {
        
        guard let url = URL(string: urlString) else {
            print("Couldn't create URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let returnet = try? JSONDecoder().decode(Returned.self, from: data) else {
//                    try? JSONDecoder().decode(Returned.self, from: data) else {
                print("JSON ERROR")
                return
            }
//            self.urlString = "https://newsapi.org/v2/top-headlines?country=tr&category=science&apiKey=6cbec9ebf72c48d68e9a89858a280692"
            self.articleArray = returnet.articles
            
        } catch {
            print("error")
        }
    }
}
