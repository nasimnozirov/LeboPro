//
//  CatalogTableViewController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 15.05.2023.
//

import UIKit

class CatalogTableViewController: UITableViewController {

    
    private let model = Basket.getProduct()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Каталог"
        
        navigationItem.largeTitleDisplayMode = .always
       
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.product.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:  UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reuseCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        var configuration = cell.defaultContentConfiguration()
        let product = model.product[indexPath.row]
        configuration.text = product
        configuration.textProperties.alignment = .natural
        cell.contentConfiguration = configuration
        return cell
    }

}
