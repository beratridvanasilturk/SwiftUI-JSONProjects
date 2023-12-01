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
            CryptosForUsdView(cryptoListViewModel: CryptoListViewModel.init())
        }
    }
}
