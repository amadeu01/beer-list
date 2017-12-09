//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        let beerImage = UIView()
        
        beerImage.backgroundColor = .blue
        beerImage.frame = CGRect(x: 50, y: 50, width: 80, height: 80)
        
        let beerName = UILabel()
        let beerTagname = UILabel()
        let description = UILabel()
        
        beerName.frame = CGRect(x: 150, y: 60, width: 200, height: 20)
        beerName.text = "Nome: Cerveja"
        beerName.textColor = .black
        
        beerTagname.frame = CGRect(x: 150, y: 90, width: 200, height: 20)
        beerTagname.text = "#tag #tag2"
        beerTagname.textColor = .black
        
        description.frame = CGRect(x: 50, y: 150, width: 200, height: 20)
        description.text = "Descrição.... loren ipsion"
        description.textColor = .black
        
        view.addSubview(beerImage)
        view.addSubview(beerName)
        view.addSubview(beerTagname)
        view.addSubview(description)
        view.backgroundColor = .white
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
