//
//  BasketTableViewController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 28.04.2023.
//

import UIKit


class BasketTableViewController: UITableViewController {
    
    private var model = Basket.getProduct()
    private var viewNavBar = UIView()

       private let basketName = CustomLabel(
           backgroundColor: .white,
           textColor: .black,
           title: "Корзина",
           font: UIFont.systemFont(ofSize: 40)
       )
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           viewNavBar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
           viewNavBar.backgroundColor = .white
           navigationController?.navigationBar.addSubview(viewNavBar)
           viewNavBar.addSubview(basketName)
         fixToConstraint()
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 145
        tableView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
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
        if let image = UIImage(named: product){
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
            self.model.product.remove(at: indexPath.row)
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
          

           basketName.heightAnchor.constraint(equalToConstant: 60),
           basketName.leadingAnchor.constraint(equalTo: viewNavBar.safeAreaLayoutGuide.leadingAnchor, constant: 10),
           basketName.bottomAnchor.constraint(equalTo: viewNavBar.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }

}
