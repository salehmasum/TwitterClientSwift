//
//  HomeDataSourceController+Navbar.swift
//  TwitterLBTA
//
//  Created by user on 14/12/18.
//  Copyright © 2018 Lets Build That App. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    
    func setupNavigationBarItems() {
        
        setupTitleView()
        setupLeftBarButton()
        setupRightBarButtons()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navbarSeparatorView = UIView()
        navbarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navbarSeparatorView)
        navbarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
    }
    
    fileprivate func setupTitleView() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    fileprivate func setupLeftBarButton() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    fileprivate func setupRightBarButtons() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        composeButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton) ]
    }
    
}
