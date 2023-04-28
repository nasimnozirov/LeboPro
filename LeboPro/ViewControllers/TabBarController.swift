//
//  TabBarController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 27.04.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.backgroundColor = .white
        rootVC()
        settingTabBar()
        
    }
    
    private func rootVC() {
        let settingVC = UINavigationController(rootViewController: SettingViewController())
        let basketVC = UINavigationController(rootViewController: BasketTableViewController())
        
        settingVC.title = "Профиль"
        basketVC.title = "Корзина"
    }

    private func settingTabBar() {
        guard let items = tabBar.items else { return }
        
        let images = ["person.fill", "basket.fill", "list.bullet.rectan", "house.fill"]
        
        for item in 0..<items.count {
            items[item].badgeValue = "1"
            items[item].image = UIImage(systemName: images[item])
        }
        
        
    }
    

        
       
}
