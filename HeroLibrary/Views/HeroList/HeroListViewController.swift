//
//  HeroListViewController.swift
//  HeroLibrary
//
//  Created by Foliveira on 12/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import UIKit

class HeroListViewController: UIViewController {
    @IBOutlet weak var heroesTB: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MarvelAPI().getCharacters(offset: 1, limit: 5) { characters in
            print(characters.data.results.count)
        }
    }
}