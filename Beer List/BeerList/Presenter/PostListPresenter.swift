//
//  PostListPresenter.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 09/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

class BeerListPresenter: BeerListPresenterProtocol {
    weak var view: BeerListViewProtocol?
    var interactor: BeerListInteractorInputProtocol?
    var wireFrame: BeerListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveBeerList()
    }
    
    func showBeerDetail(forBeerItem beerItem: BeerModel) {
        wireFrame?.presentBeerDetailScreen(from: view!, forBeerItem: beerItem)
    }
    
    func favoriteBeer(forBeerItem beerItem: BeerModel) {
        let newBeerItem = beerItem.favorited()
        interactor?.updateBeer(forBeerItem: newBeerItem)
        view?.highlightFavoriteButton(forBeerItem: newBeerItem)
    }
    func unfavoriteBeer(forBeerItem beerItem: BeerModel) {
        let newBeerItem = beerItem.unfavorited()
        interactor?.updateBeer(forBeerItem: newBeerItem)
        view?.unhighlightFavoriteButton(forBeerItem: newBeerItem)
    }
}

extension BeerListPresenter: BeerListInteractorOutputProtocol {
    func didRetrieveBeer(_ beers: [BeerModel]) {
        view?.hideLoading()
        view?.showBeers(with: beers)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
    
}
