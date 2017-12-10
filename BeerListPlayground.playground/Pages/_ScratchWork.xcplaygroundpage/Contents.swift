import Foundation
import PlaygroundSupport
import UIKit
var str = "Hello, playground"

let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))


imageView.image = placeholderImage

view.addSubview(imageView)

PlaygroundPage.current.liveView = view
