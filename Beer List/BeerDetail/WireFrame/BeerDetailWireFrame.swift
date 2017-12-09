//
//  BeerDetailWireFrame.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 06/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit

class BeerDetailWireFrame: BeerDetailWireFrameProtocol {
    
    class func createBeerDetailModule(forBeerItem beerItem: BeerModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BeerDetailController")
        if let view = viewController as? BeerDetailView {
            let presenter: BeerDetailPresenterProtocol = BeerDetailPresenter()
            let wireFrame: BeerDetailWireFrameProtocol = BeerDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.beerItem = beerItem
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
