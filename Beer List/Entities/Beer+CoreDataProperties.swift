//
//  Beer+CoreDataProperties.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 07/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import Foundation
import CoreData

extension Beer {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beer> {
        return NSFetchRequest<Beer>(entityName: "Beer");
    }
    
    @NSManaged public var tagline: String?
    @NSManaged public var isFavorite: NSNumber?
    @NSManaged public var imageUrl: String?
    @NSManaged public var beerDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int32
}
