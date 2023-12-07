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
                        //droplast: sondan baslayarak string karakteri silmede kullanildi
//                        Text(content.publishedAt?.dropLast(10) ?? "")
                        Text(content.publishedAt?.dropFirst(11).dropLast(4) ?? "")
                        Text(content.title ?? "")
                       
                       
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: content.url ?? "")!)
                    }
                    
                }
            }
            .toolbar {
                Button("Yenile") {
                    Task.init {
                        await newsViewModel.fetchData()
                    }
                }
            }
            .navigationTitle("Daily Science News")
        }        .task {
            await newsViewModel.fetchData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
