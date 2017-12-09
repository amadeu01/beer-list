//
//  BeerListProtocols.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 06/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit

protocol BeerListViewProtocol: class {
    var presenter: BeerListPresenterProtocol? { get set }
    
    func showBeers(with beers: [BeerModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol BeerListWireFrameProtocol: class {
    static func createBeerListModule() -> UIViewController
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeerItem beerItem: BeerModel)
}

protocol BeerListPresenterProtocol: class {
    var view: BeerListViewProtocol? { get set }
    var interactor: BeerListInteractorInputProtocol? { get set }
    var wireFrame: BeerListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showBeerDetail(forBeerItem beerItem: BeerModel)
}

protocol BeerListInteractorOutputProtocol: class {
    func didRetrieveBeer(_ beers: [BeerModel])
    func onError()
}

protocol BeerListInteractorInputProtocol: class {
    var presenter: BeerListInteractorOutputProtocol? { get set }
    var localDatamanager: BeerListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol? { get set }
    
    func retrieveBeerList()
}

protocol BeerListDataManagerInputProtocol: class {
}

protocol BeerListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol? { get set }
    
    func retrieveBeerList()
}

protocol BeerListRemoteDataManagerOutputProtocol: class {
    func onBeersRetrieved(_ beer: [BeerModel])
    func onError()
}

protocol BeerListLocalDataManagerInputProtocol: class {
    func retrieveBeerList() throws -> [Beer]
    func saveBeer(id: Int, title: String, beerDescription: String, imageUrl: String) throws
}

