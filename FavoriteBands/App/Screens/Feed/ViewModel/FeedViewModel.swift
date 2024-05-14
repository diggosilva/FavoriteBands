//
//  FeedViewModel.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

protocol FeedViewModelProtocol {
    func numbersOfRowsInSection() -> Int
    func feedBandFor(indexPath: IndexPath) -> FeedBand
    func loadDataBands()
    
    var state: Bindable<FeedViewControllerStates> { get set }
}

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel: FeedViewModelProtocol {
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
   
    private var service: ServiceProtocol = Service()
    private var bandsList: [FeedBand] = []
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func numbersOfRowsInSection() -> Int {
        return bandsList.count
    }
    
    func feedBandFor(indexPath: IndexPath) -> FeedBand {
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
