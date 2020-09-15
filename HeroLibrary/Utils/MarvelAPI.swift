//
//  MarvelAPI.swift
//  HeroLibrary
//
//  Created by Foliveira on 12/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import Foundation

class MarvelAPI {
    
    func getCharacters(offset: Int, limit: Int,completion: @escaping (Characters) -> ()) {
        let urlString = "https://gateway.marvel.com:443/v1/public/characters?limit=\(limit)&offset=\(offset)&ts=1599964455&apikey=7568ebb3af2e8b30c165f2e7fd029aa4&hash=e69de27cfe554bdaef9d0bbd3b5c19ae"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, result, error in
                guard let data = data else {return}
                do {
                    let characters = try JSONDecoder().decode(Characters.self, from: data)
                    completion(characters)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}
