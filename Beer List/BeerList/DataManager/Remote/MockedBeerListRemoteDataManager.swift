//
//  MockedBeerListRemoteDataManager.swift
//  Beer List
//
//  Created by Amadeu Cavalcante Filho on 29/09/18.
//  Copyright © 2018 Amadeu Cavalcante. All rights reserved.
//

class MockListRemoteDataManager: BeerListRemoteDataManagerInputProtocol {
    let beers : [BeerModel]
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol?
    
    init(_ beers: [BeerModel] ) {
        self.beers = beers
    }
    
    func retrieveBeerList() {
        self.remoteRequestHandler?.onBeersRetrieved(beers)
    }
}
