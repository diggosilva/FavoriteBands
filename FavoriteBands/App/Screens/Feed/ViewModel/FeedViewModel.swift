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
    var service = Service()
    
    var bandsList: [FeedBand] = []
    
    func numbersOfRowsInSection() -> Int {
        return bandsList.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> FeedBand {
        return bandsList[indexPath.row]
    }
    
    func loadDataBands() {
        self.service.getBands { feedBands in
            self.bandsList = feedBands
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
}
