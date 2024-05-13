//
//  Service.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
// proud-summer-warlock.glitch.me/favoriteBands

import Foundation

protocol ServiceProtocol {
    var dataTask: URLSessionDataTask? { get set }
    func getBands(onSuccess: @escaping([FeedBand]) -> Void, onError: @escaping(Error) -> Void)
    func loadMock(filename fileName: String, onSuccess: @escaping([FeedBand]) -> Void)
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
                        var feedBandMembers: [Member] = []
                        var feedBandAlbums: [Album] = []
                        
                        for member in band.members {
                            feedBandMembers.append(Member(
                                image: member.image,
                                name: member.name,
                                instrument: member.instrument))
                        }
                        
                        for album in band.albums {
                            feedBandAlbums.append(Album(
                                cover: album.cover,
                                name: album.name,
                                year: album.year,
                                firstSingle: FirstSingle(
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
    
    func loadMock(filename fileName: String, onSuccess: @escaping([FeedBand]) -> Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BandsResponse.self, from: data)
                
                var feedBand: [FeedBand] = []
                
                for band in jsonData.favoriteBands {
                    var feedBandMembers: [Member] = []
                    var feedBandAlbums: [Album] = []
                    
                    for member in band.members {
                        feedBandMembers.append(Member(
                            image: member.image,
                            name: member.name,
                            instrument: member.instrument))
                    }
                    
                    for album in band.albums {
                        feedBandAlbums.append(Album(
                            cover: album.cover,
                            name: album.name,
                            year: album.year,
                            firstSingle: FirstSingle(
                                name: album.firstSingle.name,
                                videoClip: album.firstSingle.videoClip)))
                    }
                    
                    let feedBandInstance = FeedBand(logo: band.logo, name: band.name, members: feedBandMembers, albums: feedBandAlbums)
                    feedBand.append(feedBandInstance)
                    
                    onSuccess(feedBand)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
