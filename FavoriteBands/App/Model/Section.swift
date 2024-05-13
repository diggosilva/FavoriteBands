//
//  Section.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 13/05/24.
//

import Foundation

enum TitleHeaderSection: String {
    case members
    case albums
}

enum CellType {
    case member(Member)
    case album(Album)
}

struct Section {
    var title: TitleHeaderSection
    var cells: [CellType]
    
    init(title: TitleHeaderSection, cells: [CellType]) {
        self.title = title
        self.cells = cells
    }
}
