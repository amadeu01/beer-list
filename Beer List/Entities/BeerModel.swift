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
    var title = ""
    var name = ""
    var beerDescription = ""
//    var tagline = ""
    
    var imageUrl = ""
//    var abv = 0.0
//    var ibu = 0.0
//    var targetFg = 0.0
//    var targetOg = 0.0
//    var ebc = 0.0
//    var srm = 0.0
//    var ph = 0.0
//    var attenuationLevel = 0.0
//    var foodPairing = ""
}

extension BeerModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id                <- map["id"]
        title             <- map["title"]
        name              <- map["name"]
        beerDescription       <- map["description"]
        imageUrl          <- map["image_url"]
//        abv               <- map["abv"]
//        ibu               <- map["ibu"]
//        ebc               <- map["ebc"]
//        srm               <- map["srm"]
//        ph                <- map["ph"]
//        targetFg          <- map["target_fg"]
//        targetOg          <- map["target_og"]
//        attenuationLevel  <- map["attenuation_level"]
//        foodPairing       <- map["food_pairing"]
//        foodPairing       <- map["foodPairing"]
        
    }
    
}

struct Volume: Mappable {
    var value = 0
    var unit = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        value       <- map["value"]
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
        mashTemp       <- map["mash_temp"]
        twist          <- map["twist"]
    }
}

struct Fermentation: Mappable {
    var temp: Temp?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        temp       <- map["temp"]
    }
}

struct MashTemp: Mappable {
    var temp: Temp?
    var duration: Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        temp       <- map["temp"]
        duration     <- map["duration"]
    }
}

struct Temp: Mappable {
    var value = 0
    var unit = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        value       <- map["value"]
        unit     <- map["unit"]
    }
}



