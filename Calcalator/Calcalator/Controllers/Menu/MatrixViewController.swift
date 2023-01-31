//
//  MatrixViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 31.12.2022.
//

import UIKit

class MatrixViewController: UIViewController, UINavigationControllerDelegate {
    
    var textField = UITextField.createCustomTextField()
    var label: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .blue
        l.text = "text"
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func setupViews(){
        changeVC()
        addSubViews()
        createTextFieldConstraint()
    }
    func addSubViews(){
        view.addSubview(textField)
        view.addSubview(label)
    }
    func createTextFieldConstraint(){
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    func changeVC(){
        self.title = "Matrixes"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.delegate = self
    }
}
