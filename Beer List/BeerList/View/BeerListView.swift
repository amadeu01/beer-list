//
//  BeerListView.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import UIKit
import PKHUD

class BeerListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: BeerListPresenterProtocol?
    var beerList: [BeerModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
}

extension BeerListView: BeerListViewProtocol {
    private func indexPath(forBeerItem beerItem: BeerModel) -> IndexPath {
        let row = beerList.index() { $0.id == beerItem.id}
        return IndexPath(row: row!, section: 0)
    }
    
    func unhighlightFavoriteButton(forBeerItem beerItem: BeerModel) {
        let indexPath = self.indexPath(forBeerItem: beerItem)
        beerList[indexPath.row] = beerItem
        let cell = tableView.cellForRow(at: indexPath) as! BeerTableViewCell
        cell.favoriteButton.isSelected = false
        cell.favoriteButton.isEnabled = true
    }
    
    func highlightFavoriteButton(forBeerItem beerItem: BeerModel) {
        let indexPath = self.indexPath(forBeerItem: beerItem)
        beerList[indexPath.row] = beerItem
        let cell = tableView.cellForRow(at: indexPath) as! BeerTableViewCell
        cell.favoriteButton.isSelected = true
        cell.favoriteButton.isEnabled = true
        likeAnimation(forHeartIcon: cell.favoriteButton)
    }
    
    func showBeers(with beers: [BeerModel]) {
        beerList = beers
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
}

extension BeerListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerTableViewCell
        
        let beer = beerList[indexPath.row]
        cell.set(forBeer: beer)
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    @objc func favoriteButtonTapped(_ sender: Any) {
        if let sender = sender as? UIButton {
            let beerItem = beerList.first() { $0.id == sender.tag }
            if beerItem!.isFavorite {
                presenter?.unfavoriteBeer(forBeerItem: beerItem!)
            } else {
                presenter?.favoriteBeer(forBeerItem: beerItem!)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showBeerDetail(forBeerItem: beerList[indexPath.row])
    }
}

    // MARK: - Animation

extension BeerListView {
    private func likeAnimation(forHeartIcon hearIcon: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {() -> Void in
            hearIcon.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.1, delay: 0, options: .allowUserInteraction, animations: {() -> Void in
                hearIcon.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: {(_ finished: Bool) -> Void in
                UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {() -> Void in
                    hearIcon.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                }, completion: {(_ finished: Bool) -> Void in
                    hearIcon.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
            })
        })
    }
}

