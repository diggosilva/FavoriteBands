//
//  DetailsViewModel.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

class DetailsViewModel {
    let band: FeedBand
    var sections: [Section] = []
    
    init(band: FeedBand) {
        self.band = band
        let memberSection = Section(title: .members, cells: band.members.compactMap({ CellType.member($0) }))
        let albumSection = Section(title: .albums, cells: band.albums.compactMap({ CellType.album($0) }))
        sections.append(memberSection)
        sections.append(albumSection)
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
    
    func tableView(titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section].title)".capitalized
    }
}
