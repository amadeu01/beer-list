//
//  BeerListWireFrame.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 07/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit

class BeerListWireFrame: BeerListWireFrameProtocol {
    
    class func createBeerListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "BeersNavigationController")
        if let view = navController.childViewControllers.first as? BeerListView {
            let presenter: BeerListPresenterProtocol & BeerListInteractorOutputProtocol = BeerListPresenter()
            let interactor: BeerListInteractorInputProtocol & BeerListRemoteDataManagerOutputProtocol = BeerListInteractor()
            let localDataManager: BeerListLocalDataManagerInputProtocol = BeerListLocalDataManager()
            let remoteDataManager: BeerListRemoteDataManagerInputProtocol = BeerListRemoteDataManager()
            let wireFrame: BeerListWireFrameProtocol = BeerListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        let bundle = Bundle(for: BeerListView.self)
        return UIStoryboard(name: "Main", bundle: bundle)
    }
    
    
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeerItem beerItem: BeerModel) {
        let beerDetailViewController = BeerDetailWireFrame.createBeerDetailModule(forBeerItem: beerItem)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }
    
}
