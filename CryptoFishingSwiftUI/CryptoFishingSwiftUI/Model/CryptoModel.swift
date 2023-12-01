//
//  CryptoModel.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import Foundation

struct CryptoModel: Codable, Identifiable, Hashable {
    
    let id: String
    let symbol: String
    let name: String
    let image: String
    let price: Double
    
    // CryptoModel icerisinde belirtilen price degeri json formatinda gelirken current_price olarak geldigi icin bunu duzenlenmede CodingCase kullanildi, devaminda CryptoModel'e Hashable protokolu eklendi.
    private enum CodingKeys: String, CodingKey {
        case price = "current_price"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
        case id = "id"
    }
    
}
