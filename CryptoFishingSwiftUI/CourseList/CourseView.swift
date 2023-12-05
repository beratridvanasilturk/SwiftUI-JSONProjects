//
//  CourseView.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 5.12.2023.
//

import SwiftUI

struct CourseView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    
                    HStack {
                        AsyncImage(url: URL(string: course.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(width: 130, height: 60)
                                     .shadow(radius: 5)
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                // Since the AsyncImagePhase enum isn't frozen,
                                // we need to add this currently unused fallback
                                // to handle any new cases that might be added
                                // in the future:
                                EmptyView()
                            }
                        }
                        Text(course.name)
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear{
                viewModel.fetchURL()
            }
        }
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
