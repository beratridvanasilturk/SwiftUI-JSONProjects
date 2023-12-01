//
//  CryptoViewModel.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webService = WebService()
    
    func downloadCryptos(url: URL) {
        webService.downloadCurrencies(url: url) { result in
            
            switch result {
            case .success(let success):
                if let cryptos = success {
                    //CryptoList UI'i ilgilendirdigi icin en son main'e aldik
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct CryptoViewModel {
    
    let crypto: CryptoModel
    
    var id: String {
        crypto.id
    }
    var symbol: String {
        crypto.symbol
    }
    var name: String {
        crypto.name
    }
    var image: String {
        crypto.image
    }
    var price: Double {
        crypto.price
    }
}
