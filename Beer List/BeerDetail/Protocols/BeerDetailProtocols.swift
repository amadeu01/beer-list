//
//  BeerDetailProtocols.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 06/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit

protocol BeerDetailViewProtocol: class {
    var presenter: BeerDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showBeerDetail(forBeerItem beerItem: BeerModel)
}

protocol BeerDetailWireFrameProtocol: class {
    static func createBeerDetailModule(forBeerItem beerItem: BeerModel) -> UIViewController
}

protocol BeerDetailPresenterProtocol: class {
    var view: BeerDetailViewProtocol? { get set }
    var wireFrame: BeerDetailWireFrameProtocol? { get set }
    var beerItem: BeerModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
