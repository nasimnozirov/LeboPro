//
//  TabBarController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 27.04.2023.
//

import UIKit

class CreateTabBarController: UIViewController {

    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        
    }
    
    private func createTabBar() {
        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .white
        tabBar.tabBar.backgroundColor = .black
        let settingVC = SettingViewController()
        settingVC.title = "Провиль"
        settingVC.tabBarItem.image = UIImage(systemName: "person.fill")
        settingVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        settingVC.userName = userName

        let basketVC = BasketTableViewController()
        basketVC.title = "Корзина"
        basketVC.tabBarItem.image = UIImage(systemName: "basket.fill")
        basketVC.tabBarItem.selectedImage = UIImage(systemName: "basket.fill")

     tabBar.viewControllers = [settingVC, basketVC]
        
//       let controllerArray = [settingVC, basketVC]
//       tabBar.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        view.addSubview(tabBar.view)
    }
}
