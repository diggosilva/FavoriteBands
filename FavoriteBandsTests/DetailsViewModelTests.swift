//
//  DetailsViewModelTests.swift
//  FavoriteBandsTests
//
//  Created by Diggo Silva on 11/12/24.
//

import XCTest
@testable import FavoriteBands

final class DetailsViewModelTests: XCTestCase {
    func testGetNameBand() {
        let sut: DetailsViewModelProtocol = DetailsViewModel(band: FeedBand(logo: "", name: "DuckTales", members: [], albums: []))
        let nameBand = sut.getNameBand()
        XCTAssertEqual(nameBand, "DuckTales")
    }
    
    func testNumberOfSection() {
        let sut: DetailsViewModelProtocol = DetailsViewModel(band: FeedBand(logo: "", name: "DuckTales", members: [], albums: []))
        let numberOfSection = sut.numbersOfSection()
        XCTAssertEqual(numberOfSection, 2)
    }
    
    func testWhenBandIsSelected() {
        let members = [
            Member(image: "", name: "Huguinho", instrument: ""),
            Member(image: "", name: "Zezinho", instrument: ""),
            Member(image: "", name: "Luizinho", instrument: ""),
        ]
        
        let albums = [
            Album(cover: "", name: "DuckTales", year: "", firstSingle: FirstSingle(name: "", videoClip: "")),
            Album(cover: "", name: "DuckTales II", year: "", firstSingle: FirstSingle(name: "", videoClip: "")),
        ]
        
        let sut: DetailsViewModelProtocol = DetailsViewModel(band: FeedBand(logo: "", name: "DuckTales", members: members, albums: albums))
        let rowsInMemberSection = sut.numbersOfRowsInSection(numberOfRowsInSection: 0)
        let rowsInAlbumSection = sut.numbersOfRowsInSection(numberOfRowsInSection: 1)
        
        XCTAssertEqual(rowsInMemberSection, 3)
        XCTAssertEqual(rowsInAlbumSection, 2)
        
        let titleSectionMembers = sut.tableView(titleForHeaderInSection: 0)
        let titleSectionAlbums = sut.tableView(titleForHeaderInSection: 1)
        
        XCTAssertEqual(titleSectionMembers, "Members")
        XCTAssertEqual(titleSectionAlbums, "Albums")
    }
    
    func testCellTypeFor() {
        let member = Member(image: "", name: "Huguinho", instrument: "")
        let album = Album(cover: "", name: "DuckTales", year: "", firstSingle: FirstSingle(name: "", videoClip: ""))
        let sut: DetailsViewModelProtocol = DetailsViewModel(band: FeedBand(logo: "", name: "DuckTales", members: [member], albums: [album]))
        
        let cellTypeMember = sut.cellTypeFor(indexPath: IndexPath(row: 0, section: 0))
        let cellTypeAlbum = sut.cellTypeFor(indexPath: IndexPath(row: 0, section: 1))
        
        XCTAssertTrue(cellTypeMember == .member(member))
        XCTAssertTrue(cellTypeAlbum == .album(album))
    }
}

extension CellType: @retroactive Equatable {
    
  public static func == (lhs: CellType, rhs: CellType) -> Bool {
        switch (lhs, rhs) {
        case let (.member(lhsMember), .member(rhsMember)):
            return lhsMember.name == rhsMember.name
        case let (.album(lhsAlbum), .album(rhsAlbum)):
          return lhsAlbum.name == rhsAlbum.name
        default:
            return false
        }
    }
}
