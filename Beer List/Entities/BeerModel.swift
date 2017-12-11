//
//  BeerModel.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 05/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit
import ObjectMapper

struct BeerModel {
    var id = 0
    var name = ""
    var beerDescription = ""
    var imageUrl = ""
    var tagline = ""
    var isFavorite = false
}

extension BeerModel {
    mutating func favorite() {
        self.isFavorite = true
    }
    
    mutating func unfavorite() {
        self.isFavorite = false
    }
    
    func favorited() -> BeerModel {
        var copy = self
        copy.favorite()
        return copy
    }
    
    func unfavorited() -> BeerModel {
        var copy = self
        copy.unfavorite()
        return copy
    }
}

extension BeerModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id                <- map["id"]
        name              <- map["name"]
        beerDescription   <- map["description"]
        imageUrl          <- map["image_url"]
        tagline          <- map["tagline"]
    }
}

struct Volume: Mappable {
    var value = 0
    var unit = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        value    <- map["value"]
        unit     <- map["unit"]
    }
}

struct Method: Mappable {
    
    var mashTemp: [MashTemp]?
    var fermentation: Fermentation??
    var twist: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        mashTemp   <- map["mash_temp"]
        twist      <- map["twist"]
    }
}

struct Fermentation: Mappable {
    var temp: Temp?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        temp  <- map["temp"]
    }
}

struct MashTemp: Mappable {
    var temp: Temp?
    var duration: Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        temp       <- map["temp"]
        duration   <- map["duration"]
    }
}

struct Temp: Mappable {
    var value = 0
    var unit = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        value    <- map["value"]
        unit     <- map["unit"]
    }
}



