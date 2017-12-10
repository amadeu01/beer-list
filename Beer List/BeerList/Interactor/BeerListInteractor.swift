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
        do {
            remoteDatamanager?.retrieveBeerList()
            
//            if let beerList = try localDatamanager?.retrieveBeerList() {
//                let beerModelList = beerList.map() {
//                    return BeerModel(id: Int($0.id), name: $0.name!, beerDescription: $0.beerDescription!, imageUrl: $0.imageUrl!, tagline: $0.tagline!)
//                }
//                if  beerModelList.isEmpty {
//                    remoteDatamanager?.retrieveBeerList()
//                }else{
//                    presenter?.didRetrieveBeer(beerModelList)
//                }
//            }
            
        } catch {
            presenter?.didRetrieveBeer([])
        }
    }
    
}

extension BeerListInteractor: BeerListRemoteDataManagerOutputProtocol {
    
    func onBeersRetrieved(_ beers: [BeerModel]) {
        presenter?.didRetrieveBeer(beers)
        
        for beerModel in beers {
            do {
                try localDatamanager?.saveBeer(id: beerModel.id, name: beerModel.name, beerDescription: beerModel.beerDescription, tagline: beerModel.tagline, imageUrl: beerModel.imageUrl)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
