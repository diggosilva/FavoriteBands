//
//  DetailsViewModel.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

enum DetailsViewControllerStates {
    case loading
    case loaded
    case error
}

enum DetailSection {
    case member([Member])
    case album([Album])
}

class DetailsViewModel {
    private var state: Bindable<DetailsViewControllerStates> = Bindable(value: .loading)
    private var service: ServiceProtocol = Service()
    
    var bands: [FeedBand] = []
    var sections: [DetailSection] = []

    func numbersOfSection() -> Int {
        switch sections[0] {
        case .member(let member):
            return member.count
        case .album(let album):
            return album.count
        }
    }
    
    func numbersOfRowsInSection() -> Int {
        return sections.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> DetailSection {
        let section = sections[indexPath.section]
        return sections[indexPath.section]
    }
    
    func loadDataDetails() {
        service.getBands { memberDetails in
            self.bands = memberDetails
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
}
