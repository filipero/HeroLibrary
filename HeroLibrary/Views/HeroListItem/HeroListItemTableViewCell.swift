//
//  HeroListItemTableViewCell.swift
//  HeroLibrary
//
//  Created by Foliveira on 14/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import UIKit

class HeroListItemTableViewCell: UITableViewCell {
    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
