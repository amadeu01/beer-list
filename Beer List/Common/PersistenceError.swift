//
//  PersistenceError.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
