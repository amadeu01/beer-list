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
    
    func saveBeer(forBeerItem beerItem: BeerModel) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request: NSFetchRequest<Beer> = NSFetchRequest(entityName: String(describing: Beer.self))
        request.predicate = NSPredicate(format: "id == %d", beerItem.id)
        let fetched = try managedOC.fetch(request)
        
        if fetched.count == 1 {
            let tempBeer = fetched.first!
            tempBeer.name = beerItem.name
            tempBeer.beerDescription = beerItem.beerDescription
            tempBeer.imageUrl = beerItem.imageUrl
            tempBeer.tagline = beerItem.tagline
            tempBeer.isFavorite = NSNumber(booleanLiteral: beerItem.isFavorite)
            try managedOC.save()
        } else {
            if let newBeer = NSEntityDescription.entity(forEntityName: "Beer",
                                                        in: managedOC) {
                let beer = Beer(entity: newBeer, insertInto: managedOC)
                beer.id = Int32(beerItem.id)
                beer.name = beerItem.name
                beer.beerDescription = beerItem.beerDescription
                beer.imageUrl = beerItem.imageUrl
                beer.tagline = beerItem.tagline
                beer.isFavorite = NSNumber(booleanLiteral: beerItem.isFavorite)
                try managedOC.save()
            }
        }
    }
}
