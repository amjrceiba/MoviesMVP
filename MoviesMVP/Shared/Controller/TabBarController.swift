//
//  TabBarController.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shopping center"
        //create movies controller
        let moviesVC = MoviesViewController()
        moviesVC.title = "Movies"
        moviesVC.tabBarItem.image = UIImage(systemName: "film")
        //create cart controller
        let cartVC = CartViewController()
        cartVC.title = "Cart"
        cartVC.tabBarItem.image = UIImage(systemName: "cart")
        //add view controllers to tabBar controller
        self.setViewControllers([moviesVC, cartVC], animated: false)
        
        addObserver()
        updateCartBadge(notification: Notification(name: Notification.Name("updateCartBadge")))
    }
    
    private func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateCartBadge(notification:)), name: Notification.Name("updateCartBadge"), object: nil)
    }
    
    @objc private func updateCartBadge(notification: Notification) {
        if DBController().getMovies().count > 0{
            tabBar.items?[1].badgeValue = "\(DBController().getMovies().count)"
        }else{
            tabBar.items?[1].badgeValue = nil
        }
    }
}
