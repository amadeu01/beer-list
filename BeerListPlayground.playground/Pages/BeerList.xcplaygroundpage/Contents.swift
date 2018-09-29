
import Foundation
import UIKit
import PlaygroundSupport
@testable import BeerListPlayground

do {
    let view = BeerListWireFrame.createBeerListModule()
    
    let (parent, _) =
        playgroundControllers(device: .phone4_7inch,
                              orientation: .portrait,
                              child: view)
    
    let frame = parent.view.frame
    
    PlaygroundPage.current.liveView = parent
    parent.view.frame = frame
    
} catch {
    print(error)
}

