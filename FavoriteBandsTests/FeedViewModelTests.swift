//
//  FeedViewModelTests.swift
//  FavoriteBandsTests
//
//  Created by Diggo Silva on 11/12/24.
//

import XCTest
@testable import FavoriteBands

class MockSuccess: ServiceProtocol {
    func getBands(onSuccess: @escaping ([FavoriteBands.FeedBand]) -> Void, onError: @escaping (Error) -> Void) {
        onSuccess([
            FeedBand(logo: "", name: "Korn", members: [], albums: []),
            FeedBand(logo: "", name: "Metallica", members: [], albums: []),
        ])
    }
}

class MockFailure: ServiceProtocol {
    func getBands(onSuccess: @escaping ([FavoriteBands.FeedBand]) -> Void, onError: @escaping (Error) -> Void) {
        onError(NSError())
    }
}

final class FeedViewModelTests: XCTestCase {
    func testWhenSuccess() {
        let sut = FeedViewModel(service: MockSuccess())
        sut.state.bind { state in
            XCTAssertTrue(state == .loaded)
        }
        sut.loadDataBands()
        sut.state.value = .loaded
        
        XCTAssertEqual(sut.numbersOfRowsInSection(), 2)
        
        let firstBand = sut.feedBandFor(indexPath: IndexPath(row: 0, section: 0))
        let secondBand = sut.feedBandFor(indexPath: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(firstBand.name, "Korn")
        XCTAssertEqual(secondBand.name, "Metallica")
    }
    
    func testWhenFailure() {
        let sut = FeedViewModel(service: MockFailure())
        sut.state.bind { state in
            XCTAssertTrue(state == .error)
        }
        sut.loadDataBands()
        XCTAssertEqual(sut.state.value, .error)
    }
}
