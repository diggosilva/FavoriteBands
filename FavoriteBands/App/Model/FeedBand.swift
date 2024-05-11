//
//  FeedBand.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

struct FeedBand {
    let logo: String
    let name: String
    let members: [Member]
    let albums: [Album]
}

struct Member {
    let image: String
    let name, instrument: String
}

struct Album {
    let cover: String
    let name, year: String
    let firstSingle: FirstSingle
}

struct FirstSingle {
    let name: String
    let videoClip: String
}
