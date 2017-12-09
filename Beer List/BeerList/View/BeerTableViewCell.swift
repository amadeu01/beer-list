//
//  BeerTableViewCell.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//


import UIKit
import AlamofireImage

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var taglineLabel: UILabel!
    
    func set(forBeer beer: BeerModel) {
        self.selectionStyle = .none
        nameLabel?.text = beer.name
        taglineLabel?.text = beer.tagline
        let url = URL(string: beer.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        beerImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
