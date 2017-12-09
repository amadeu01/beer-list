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
            if let beerList = try localDatamanager?.retrieveBeerList() {
                let beerModelList = beerList.map() {
                    return BeerModel(id: Int($0.id), title: $0.title!, name: $0.name!, beerDescription: $0.beerDescription!, imageUrl: $0.imageUrl!)
                }
                if  beerModelList.isEmpty {
                    remoteDatamanager?.retrieveBeerList()
                }else{
                    presenter?.didRetrieveBeer(beerModelList)
                }
            } else {
                remoteDatamanager?.retrieveBeerList()
            }
            
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
                try localDatamanager?.saveBeer(id: beerModel.id, title: beerModel.title, beerDescription: beerModel.beerDescription, imageUrl: beerModel.imageUrl)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
