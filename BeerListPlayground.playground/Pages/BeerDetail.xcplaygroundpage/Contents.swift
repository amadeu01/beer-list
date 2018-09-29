
import Foundation
import UIKit
import PlaygroundSupport
@testable import BeerListPlayground

var beerItem = BeerModel()
beerItem.id = 10
beerItem.name = "Punk IPA 2007 - 2010"
beerItem.tagline = "Post Modern Classic. Spiky. Tropical. Hoppy."
beerItem.beerDescription = "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish."
beerItem.imageUrl = "https://images.punkapi.com/v2/192.png"

do {
    let controller = BeerDetailWireFrame.createBeerDetailModule(forBeerItem: beerItem)
    let navigationController = UINavigationController()
    navigationController.addChild(controller)
    let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: navigationController)
    let frame = parent.view.frame
    PlaygroundPage.current.liveView = parent
    parent.view.frame = frame
    
} catch {
    print(error)
}
