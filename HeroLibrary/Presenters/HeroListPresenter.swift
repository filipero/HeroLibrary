//
//  HeroListPresenter.swift
//  HeroLibrary
//
//  Created by Foliveira on 12/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import Foundation

protocol UpdateDelegate {
    func updateTableView()
}

class HeroListPresenter {
    
    func getHeroes(offset: Int, callback: @escaping ([Result]?) -> Void) {
        var characters: [Result]? = []
        MarvelAPI().getCharacters(offset: offset, limit: 20, completion: { ch in
            characters = ch.list
            callback(characters)
        })
    }
}
