//
//  Service.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import Foundation

protocol ServiceProtocol {
    var dataTask: URLSessionDataTask? { get set }
}

class Service: ServiceProtocol {
    var dataTask: URLSessionDataTask?
    
    func getBands(onSuccess: @escaping([FeedBand]) -> Void, onError: @escaping(Error) -> Void ) {
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
                        feedBand.append(FeedBand(logo: band.logo))
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
    
    func getDetailsBands(onSuccess: @escaping(MemberDetails) -> Void, onError: @escaping(Error) -> Void ) {
        guard let url = URL(string: "https://ash-steel-holly.glitch.me/favoriteBands") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                do {
                    let bandsResponse = try JSONDecoder().decode(BandsResponse.self, from: data ?? Data())
                    var detailMember: MemberDetails
                    
                        detailMember = MemberDetails(
                            image: bandsResponse.favoriteBands[0].members[0].image, 
                            name: bandsResponse.favoriteBands[0].members[0].name,
                            instrument: bandsResponse.favoriteBands[0].members[0].instrument)
                    
                    onSuccess(detailMember)
                    print("DEBUG: Detalhes das Bandas.. \(detailMember)")
                } catch {
                    onError(error)
                    print("DEBUG: Erro ao decodificar Detalhes das Bandas.. \(error.localizedDescription)")
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
