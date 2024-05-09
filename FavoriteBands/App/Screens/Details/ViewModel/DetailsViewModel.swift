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

enum CellType {
    case member(Member)
    case album(Album)
}

class DetailsViewModel {
    private var state: Bindable<DetailsViewControllerStates> = Bindable(value: .loading)
    private var service: ServiceProtocol = Service()
    
    let band: FeedBand
    var sections: [Section] = []
    
    init(band: FeedBand) {
        self.band = band
    }
    
    func numbersOfSection() -> Int {
        return sections.count
    }
    
    func numbersOfRowsInSection(numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> CellType {
        let section = sections[indexPath.section]
        let cell = section.cells[indexPath.row]
        return cell
    }
}

struct Section {
    var title: String
    var cells: [CellType]
    
    init(title: String, cells: [CellType]) {
        self.title = title
        self.cells = cells
    }
}
