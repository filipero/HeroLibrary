//
//  HeroDetailViewController.swift
//  HeroLibrary
//
//  Created by Foliveira on 15/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var imgUrl: String?
    var heroName: String?
    var heroDescription: String?
    
    init(hero: Result) {
        
        heroName = hero.name
        heroDescription = hero.description == "" ? "Nenhuma descrição disponível" : hero.description
        imgUrl = "\(hero.thumbnail?.path ?? "").\(hero.thumbnail?.extension ?? "")"
        super.init(nibName: "HeroDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let img = imgUrl, let url = URL(string: img) {
            avatarImgView.load(url: url)
        }
        descriptionLabel.text = heroDescription
        heroNameLabel.text = heroName

    }
    
}
