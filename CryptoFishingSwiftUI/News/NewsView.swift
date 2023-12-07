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
                ForEach(newsViewModel.articleArray, id: \.self) { content in
                    VStack {
                        Text(content.title ?? "")
                        //droplast: sondan baslayarak string karakteri silmede kullanildi
                        Text(content.publishedAt?.dropLast(10) ?? "")
                        Text(content.publishedAt?.dropFirst(11).dropLast(4) ?? "")
                    }
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: content.url ?? "")!)
                    }
                    
                }
            }
            .navigationTitle("Daily Science News")
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
