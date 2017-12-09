//
//  BeerListLocalDataManager.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import CoreData

class BeerListLocalDataManager: BeerListLocalDataManagerInputProtocol {
    
    func retrieveBeerList() throws -> [Beer]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Beer> = NSFetchRequest(entityName: String(describing: Beer.self))
        
        return try managedOC.fetch(request)
    }
    
    func saveBeer(id: Int, name: String, beerDescription: String, tagline: String, imageUrl: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newBeer = NSEntityDescription.entity(forEntityName: "Beer",
                                                    in: managedOC) {
            let beer = Beer(entity: newBeer, insertInto: managedOC)
            beer.id = Int32(id)
            beer.name = name
            beer.beerDescription = beerDescription
            beer.imageUrl = imageUrl
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject
        
    }
    
}
