//
//  Service.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

protocol ServiceProtocol {
    var dataTask: URLSessionDataTask? { get set }
    func getBands(onSuccess: @escaping([FeedBand]) -> Void, onError: @escaping(Error) -> Void)
}

class Service: ServiceProtocol {
    var dataTask: URLSessionDataTask?
    
    func getBands(onSuccess: @escaping([FeedBand]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://ash-steel-holly.glitch.me/favoriteBands") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                do {
                    let bandsResponse = try JSONDecoder().decode(BandsResponse.self, from: data ?? Data())
                    var feedBand: [FeedBand] = []
                    
                    for band in bandsResponse.favoriteBands {
                        var feedBandMembers: [FeedBand.Member] = []
                        var feedBandAlbums: [FeedBand.Album] = []
                        
                        for member in band.members {
                            feedBandMembers.append(FeedBand.Member(
                                image: member.image,
                                name: member.name,
                                instrument: member.instrument))
                        }
                        
                        for album in band.albums {
                            feedBandAlbums.append(FeedBand.Album(
                                cover: album.cover,
                                name: album.name,
                                year: album.year,
                                firstSingle: FeedBand.FirstSingle(
                                    name: album.firstSingle.name,
                                    videoClip: album.firstSingle.videoClip)))
                        }
                        
                        let feedBandInstance = FeedBand(logo: band.logo, name: band.name, members: feedBandMembers, albums: feedBandAlbums)
                        feedBand.append(feedBandInstance)
                    }
                    onSuccess(feedBand)
                    print("DEBUG: Logo das Bandas.. \(feedBand)")
                } catch {
                    onError(error)
                    print("DEBUG: Erro ao decodificar Logo das Bandas.. \(error.localizedDescription)")
                }
            }
        })
        dataTask?.resume()
    }
}

struct MemberDetails: Codable {
    let image: String
    let name: String
    let instrument: String
}
