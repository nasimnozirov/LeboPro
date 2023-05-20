//
//  TabBarController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 27.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    var userName = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        let topVC = TopViewController()
        let catalogVC = CatalogTableViewController()
        let basketVC = BasketTableViewController()
        let favoriteVC = FavoriteViewController()
        let settingVC = SettingViewController()
        let basketNavigation = UINavigationController(rootViewController: basketVC)
        let favoriteNavigation = UINavigationController(rootViewController: favoriteVC)
        viewControllers = [topVC, catalogVC, basketNavigation , favoriteNavigation, settingVC,]
        tabBar.backgroundColor = .white
        topVC.tabBarItem = UITabBarItem(title: "Главное", image: UIImage(systemName: "house.fill"), tag: 0)
        catalogVC.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "list.clipboard.fill"), tag: 1)
        basketVC.tabBarItem = UITabBarItem(title: "Карзина", image: UIImage(systemName: "basket.fill"), tag: 2)
        favoriteVC.tabBarItem = UITabBarItem(title: "Любимые", image: UIImage(systemName: "heart.fill"), tag: 3)
        settingVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 4)
    }
}
