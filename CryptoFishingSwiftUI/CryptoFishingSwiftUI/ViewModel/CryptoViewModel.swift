//
//  CryptoViewModel.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import Foundation

@MainActor
class CryptoListViewModel: ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webService = WebService()
    
    func downloadCryptos(url: URL) async {
        do {
            let cryptos = try await webService.downloadCurrincies(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
            
            // Bu swift dosyasi icerisindeki tum islemlerin ui'i ilgilendirdigi icin MainActor eklendi, ve cryptoList guncellenmesi otomatikman main'e alinmis oldugu icin dispatchQueue.main.async comment yaptik
            // Tum islemleri main'de calistirmak istedigimiz zaman ve DispatchQueue'leri dosya icerisinde surekli yazmak zorunda kalmamak icin MainActor kullanisli bir aractir.
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModel.init)
//            }
        } catch {
            print(error)
        }
    }
    /*
    // Escaping kullanarak daha cok uikit versiyonu ile backendden veri cekmede kullandik, eskiden kullanilan yontem
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
     */
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
