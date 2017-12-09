//
//  BeerListRemoteDataManager.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BeerListRemoteDataManager: BeerListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol?
    
    func retrieveBeerList() {
        Alamofire
            .request(Endpoints.Beers.fetch.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[BeerModel]>) in
                switch response.result {
                case .success(let beers):
                    self.remoteRequestHandler?.onBeersRetrieved(beers)
                    
                case .failure(_ ):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
