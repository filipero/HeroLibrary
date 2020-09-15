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
    
    private var presenter: HeroListPresenter!
    private var heroList: [Result]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HeroListPresenter()
        heroesTB.delegate = self
        heroesTB.dataSource = self
        heroesTB.register(UINib(nibName: "HeroListItemTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroListItemTableViewCell")
        loadData()
    }
    
    private func loadData() {
        presenter.getHeroes(offset: heroList?.count ?? 0) { (hero) in
            guard let heroes = hero else {return}
            self.heroList?.append(contentsOf: heroes)
            DispatchQueue.main.async {
                self.heroesTB.reloadData()
            }
        }
    }
}

// MARK: - Tableview delegate & datasource
extension HeroListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let list = heroList else {return}
        if (indexPath.row == list.count - 1){
            loadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroListItemTableViewCell", for: indexPath) as! HeroListItemTableViewCell
        cell.heroNameLabel.text = heroList?[indexPath.row].name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let list = heroList else {return}
        let vc = HeroDetailViewController(hero: list[indexPath.row])
        present(vc, animated: true, completion: nil)
    }
}
