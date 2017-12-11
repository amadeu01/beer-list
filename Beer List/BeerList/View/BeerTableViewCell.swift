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
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(1.5)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.gray
        self.addSubview(additionalSeparator)
    }
    
    func set(forBeer beer: BeerModel) {
        self.selectionStyle = .none
        nameLabel?.text = "🍺 " + beer.name
        taglineLabel?.text = beer.tagline
        favoriteButton?.tag = beer.id
        favoriteButton.setImage(#imageLiteral(resourceName: "hear_filled"), for: .selected)
        favoriteButton.isSelected = beer.isFavorite
        let url = URL(string: beer.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        beerImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
