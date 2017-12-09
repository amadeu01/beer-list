//
//  BeerDetailView.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 06/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit
import AlamofireImage

class BeerDetailView: UIViewController {
    
    
    @IBOutlet weak var beerImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: BeerDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension BeerDetailView: BeerDetailViewProtocol {
    
    func showBeerDetail(forBeerItem beerItem: BeerModel) {
        titleLabel?.text = beerItem.title
        let url = URL(string: beerItem.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        beerImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
}
