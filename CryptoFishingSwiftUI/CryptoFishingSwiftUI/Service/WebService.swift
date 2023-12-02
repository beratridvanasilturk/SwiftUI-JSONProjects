//
//  WebService.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import Foundation

class WebService {
    
    func downloadCurrincies(url: URL) async throws -> [CryptoModel] {
        //URLsession.data 'da tipki escaping versiyonunda dataTask'de oldugu gibi icerisinde data, response ve error'u barindirdigi icin let (data,response) olarak bildirdik ancak hatalari ele almayi burada degerlendirmek istemedigimiz icin let (data, _) seklinde tanimladik
        // fonksiyon async oi await'i kullanmak zorunludur
        // bu bir throwing fonksiyonu yani bir hata firlatabilir oi try kullanmak zorundayiz
        // async throws ile hatalari burda degil fonksiyonun cagrilan yerde do try catch ile hatalari ele alacagimizi belirttik
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoModel].self, from: data)
        
        return currencies ?? []
    }
    
    // Escaping kullanarak daha cok uikit versiyonu ile backendden veri cekmede kullandik, eskiden kullanilan yontem
    /*
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
     */
}

enum DownloaderError: Error {
    case badUrl
    case noData
    case parsingError
}
