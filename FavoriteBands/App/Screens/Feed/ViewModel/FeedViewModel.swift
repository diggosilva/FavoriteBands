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
    private (set) var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    private var service: ServiceProtocol = Service()
    
    private var bandsList: [FeedBand] = []
    
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
