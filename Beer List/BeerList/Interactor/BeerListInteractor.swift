//
//  BeerListInteractor.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//


class BeerListInteractor: BeerListInteractorInputProtocol {
    weak var presenter: BeerListInteractorOutputProtocol?
    var localDatamanager: BeerListLocalDataManagerInputProtocol?
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol?
    
    func retrieveBeerList() {
        remoteDatamanager?.retrieveBeerList()
    }
    
    func updateBeer(forBeerItem beerItem: BeerModel) {
        do {
            try localDatamanager?.saveBeer(forBeerItem: beerItem)
        } catch {
            presenter?.onError()
        }
    }
}

extension BeerListInteractor {
    private func getLocalBeerList() -> [BeerModel] {
        do {
            if let localBeerList = try localDatamanager?.retrieveBeerList() {
                return localBeerList.map() {
                    return BeerModel(id: Int($0.id), name: $0.name!, beerDescription: $0.beerDescription!, imageUrl: $0.imageUrl!, tagline: $0.tagline!, isFavorite: Bool(truncating: $0.isFavorite!))
                }
            }
        } catch {}
        return [BeerModel]()
    }
}

extension BeerListInteractor: BeerListRemoteDataManagerOutputProtocol {
    
    func onBeersRetrieved(_ beers: [BeerModel]) {
        let localBeers = getLocalBeerList()
        
        let beerList = beers.map() { (beer: BeerModel) -> BeerModel in
            let localBeer = localBeers.first() { $0.id == beer.id }
            if localBeer != nil {
                return BeerModel(id: beer.id, name: beer.name, beerDescription: beer.beerDescription, imageUrl: beer.imageUrl, tagline: beer.tagline, isFavorite: localBeer!.isFavorite)
            } else {
                return BeerModel(id: beer.id, name: beer.name, beerDescription: beer.beerDescription, imageUrl: beer.imageUrl, tagline: beer.tagline, isFavorite: false)
            }
        }
        
        for beerModel in beerList {
            do {
                try localDatamanager?.saveBeer(forBeerItem: beerModel)
            } catch  {}
        }
        presenter?.didRetrieveBeer(beerList)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
