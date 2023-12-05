//
//  CryptoFishingSwiftUIApp.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import SwiftUI

@main
struct CryptoFishingSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CryptosForUsdView(cryptoListViewModel: CryptoListViewModel.init())
                .tabItem {
                    Label("Crypto", systemImage: "person")
                }
                CourseView()
                    .tabItem {
                        Label("Course", systemImage: "person.2.wave.2.fill")
                    }
                NewsView()
                    .tabItem {
                        Label("News", systemImage: "person")
                    }
                
            }
        }
    }
}
