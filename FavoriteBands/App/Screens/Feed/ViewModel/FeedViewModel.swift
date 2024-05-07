//
//  FeedViewModel.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel {
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    
    
    func numbersOfRowsInSection() {
        
    }
    
    func cellForRowAt(indexPath: IndexPath) {
        
    }
    
    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.state.value = .loaded
        }
    }
}
