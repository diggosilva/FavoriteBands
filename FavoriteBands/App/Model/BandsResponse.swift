//
//  BandsResponse.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

struct BandsResponse: Codable {
    let favoriteBands: [FavoriteBand]
}

struct FavoriteBand: Codable {
    let logo: String
    let name: String
    let members: [Member]
    let albums: [Album]
}

struct Album: Codable {
    let cover: String
    let name, year: String
    let firstSingle: FirstSingle

    enum CodingKeys: String, CodingKey {
        case cover, name, year
        case firstSingle = "first_single"
    }
}

struct FirstSingle: Codable {
    let name: String
    let videoClip: String

    enum CodingKeys: String, CodingKey {
        case name
        case videoClip = "video_clip"
    }
}

struct Member: Codable {
    let image: String
    let name, instrument: String
}
