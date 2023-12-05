//
//  NewsView.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 5.12.2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(newsViewModel.articleArray, id: \.self) { new in
                    VStack {
                        Text(new.author!)
                        Text(new.title!)
                        
                    }
//                        .foregroundColor(.black)
//                    Text(new.source!)
//                    Text(new.)
//                    Text(new.url)
                    
                }
            }
            .navigationTitle("News")
        }
        
        .task {
            await newsViewModel.fetchData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
