//
//  BeerListProtocols.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 06/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit

// MARK: - View Protocol

protocol BeerListViewProtocol: class {
    var presenter: BeerListPresenterProtocol? { get set }
    
    func showBeers(with beers: [BeerModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
    
    func highlightFavoriteButton(forBeerItem beerItem: BeerModel)
    
    func unhighlightFavoriteButton(forBeerItem beerItem: BeerModel)
}

// MARK: - WireFrame Protocol

protocol BeerListWireFrameProtocol: class {
    static func createBeerListModule() -> UIViewController
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeerItem beerItem: BeerModel)
}

// MARK: - Presenter Protocol

protocol BeerListPresenterProtocol: class {
    var view: BeerListViewProtocol? { get set }
    var interactor: BeerListInteractorInputProtocol? { get set }
    var wireFrame: BeerListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func showBeerDetail(forBeerItem beerItem: BeerModel)
    
    func favoriteBeer(forBeerItem beerItem: BeerModel)
    
    func unfavoriteBeer(forBeerItem beerItem: BeerModel)
}

// MARK: - Interactors Protocol

protocol BeerListInteractorOutputProtocol: class {
    func didRetrieveBeer(_ beers: [BeerModel])
    func onError()
}

protocol BeerListInteractorInputProtocol: class {
    var presenter: BeerListInteractorOutputProtocol? { get set }
    var localDatamanager: BeerListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol? { get set }
    
    func retrieveBeerList()
    func updateBeer(forBeerItem beerItem: BeerModel)
}

// MARK: - Data Manager Protocol

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
    func saveBeer(forBeerItem beerItem: BeerModel) throws
}

