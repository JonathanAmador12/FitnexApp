//
//  DiscoverViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 11/11/24.
//

import Foundation
import Combine

class DiscoverViewModel: ObservableObject {
    
    @Published var imagesPublisher: [HomeViewPictures] = []
    @Published var searchText: String = ""
    @Published var isSearchBarActive:Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    var filteredItems:[HomeViewPictures] {
        if searchText.isEmpty {
            return imagesPublisher
        } else {
            return imagens.filter {$0.title.lowercased().contains(searchText.lowercased())}
        }
    }
    
    private var imagens:[HomeViewPictures] = [
        HomeViewPictures(id: 1, image: "gymOne", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 2, image: "gymTwo", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 3, image: "gymThree", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 4, image: "gymFour", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate"),
        HomeViewPictures(id: 5, image: "gymFive", title: "Squat Movement Exercise", time: "6 minutes", level: "Intermediate")
    ]
    
    init() {
        imagesPublisher = imagens
        
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { _ in
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    func detectScrollDirection(newOffset: CGFloat) {
        if newOffset - 170 > 0 {
            isSearchBarActive = true
        }
    }
    
}
