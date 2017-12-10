
import Foundation
import UIKit
import PlaygroundSupport
@testable import BeerListPlayground


do {
    let navigationController = BeerListWireFrame.createBeerListModule()
    let controllers = navigationController.childViewControllers
    let beerListController = controllers.first
    let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: navigationController)
    let frame = parent.view.frame
    PlaygroundPage.current.liveView = parent
    parent.view.frame = frame
    
} catch {
    print(error)
}

