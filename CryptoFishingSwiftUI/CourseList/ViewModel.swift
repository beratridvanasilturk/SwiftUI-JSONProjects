//
//  ViewModel.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 5.12.2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var courses: [CourseModel] = []
    
    func fetchURL() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
        //TODO: - Weak self'i tam olarak memory leak'ten kacinmak icin mi kullandik bi arastir.
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let courses = try JSONDecoder().decode([CourseModel].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
