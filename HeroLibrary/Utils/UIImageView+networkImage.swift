//
//  UIImageView+networkImage.swift
//  HeroLibrary
//
//  Created by Foliveira on 15/09/20.
//  Copyright © 2020 filipero.dev. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
