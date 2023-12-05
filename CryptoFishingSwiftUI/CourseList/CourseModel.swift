//
//  Service.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 5.12.2023.
//

import Foundation

struct CourseModel: Codable, Identifiable, Hashable {
    
    let id: UUID?
    let name: String
    let image: String
}
