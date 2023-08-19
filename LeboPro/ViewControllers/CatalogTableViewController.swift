//
//  CatalogTableViewController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 15.05.2023.
//

import UIKit

class CatalogTableViewController: UITableViewController {
    
    var products: [Product] = []
    private var viewNavBar = UIView()

       private var catalog = CustomLabel(
        backgroundColor: .white,
        textColor: .black,
        title: "Каталог",
        font: UIFont.systemFont(ofSize: 50)
       )
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           viewNavBar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
           viewNavBar.backgroundColor = .white
           navigationController?.navigationBar.addSubview(viewNavBar)
           viewNavBar.addSubview(catalog)
         fixToConstraint()
       }
    
       override func viewDidLoad() {
           super.viewDidLoad()
           tableView.rowHeight = 145
           tableView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
          
       }
       
       // MARK: - Table view data source
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return products.count
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell:  UITableViewCell
           if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
               cell = reuseCell
           } else {
               cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
           }
           
           var configuration = cell.defaultContentConfiguration()
           let product = products[indexPath.row]
           configuration.text = product.name
           if let image = UIImage(named: product.image){
               configuration.image = image
           }
           
           configuration.textProperties.alignment = .natural
           configuration.imageProperties.cornerRadius = tableView.rowHeight / 2
           
           cell.contentConfiguration = configuration
           
           return cell
       }
       
       //УДАЛЯЕМ ЯЧЕЙКИ
       override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { _,_,_ in
               self.products.remove(at: indexPath.row)
               tableView.reloadData()
           })
           
           let editAction = UIContextualAction(style: .normal, title: "Edit", handler: { _,_,_ in
               
               tableView.reloadData()
           })
           return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
       }
       
       //дополнительная функция удалене итд с левой части экрана появляется
       override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
           return .none
       }
    
       // чтобы ячейки не сдивигались
       override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
           return false
       }
       
       private func fixToConstraint() {
           NSLayoutConstraint.activate([
              catalog.heightAnchor.constraint(equalToConstant: 60),
              catalog.leadingAnchor.constraint(equalTo: viewNavBar.safeAreaLayoutGuide.leadingAnchor, constant: 10),
              catalog.bottomAnchor.constraint(equalTo: viewNavBar.safeAreaLayoutGuide.bottomAnchor, constant: 0)
           ])
       }
   }
