//
//  BeersTableViewController.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {

    var presenter: IGenericPresenter!
    var beers: [Beer] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    let cellId = "beerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View settings
    private func setupView() {
        navigationItem.title = "All Beers"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return beers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BeerTableViewCell
        cell.setup(beer: beers[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(beers[indexPath.row])
    }
}

extension BeersTableViewController: IGenericView {
    func showEmptyScreen() {
        // Exibir alguma informação de que a view não possui resultados
    }
    
    func showItems<T>(_ data: T) {
        beers = data as! [Beer]
    }
}

