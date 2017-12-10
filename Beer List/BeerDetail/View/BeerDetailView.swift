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
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    
    var presenter: BeerDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.translatesAutoresizingMaskIntoConstraints = false
        presenter?.viewDidLoad()
        updateConstraintIfNeeded()
        
    }
    
    private func updateConstraintIfNeeded() {
        let beerImageContraints = self.view.constraints.filter { $0.identifier == "beerDetailImageTopContraint"}
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        guard let navigationBarHeight = self.navigationController?.navigationBar.frame.height else {
            return
        }
        
        guard let beerImageTopContraint = beerImageContraints.first else {
            return
        }
        
        beerImageTopContraint.constant = navigationBarHeight + statusBarHeight + 5
        beerImageTopContraint.isActive = true
        
        self.view.layoutIfNeeded()
    }
    
}

extension BeerDetailView: BeerDetailViewProtocol {
    
    func showBeerDetail(forBeerItem beerItem: BeerModel) {
        nameLabel?.text = beerItem.name
        beerDescriptionLabel?.text = beerItem.beerDescription
        let url = URL(string: beerItem.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        beerImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
}
