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
        let urlString = ""
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, result, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(Characters.self, from: data){
                    }
                }
            }.resume()
        }
    }
}
