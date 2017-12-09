//
//  BeerDetailPresenter.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 06/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

class BeerDetailPresenter: BeerDetailPresenterProtocol {
    
    weak var view: BeerDetailViewProtocol?
    var wireFrame: BeerDetailWireFrameProtocol?
    var beerItem: BeerModel?
    
    func viewDidLoad() {
        view?.showBeerDetail(forBeerItem: beerItem!)
    }
    
}
