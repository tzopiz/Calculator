//
//  ZViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 29.11.2022.
//

import UIKit

class ZViewController: UIViewController, UINavigationControllerDelegate  {
    let dataSource = MenuDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func setupViews(){
        changeVC()
    }
    
    func changeVC(){
        self.title = "Integer"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        navigationController?.delegate = self
    }
}
