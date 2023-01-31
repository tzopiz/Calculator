//
//  FunctionsViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 25.11.2022.
//

import UIKit

class FunctionsViewController: UIViewController, UITableViewDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate{
    
    var tableView = UITableView(frame: CGRect.zero, style: .plain)
    let dataSource = MenuDataSource()
    let identifier = "Cell"
    var sizes = Sizes()

    override func viewDidLoad() {
        super.viewDidLoad()
        sizes = Sizes(view.bounds.size.width, view.bounds.size.height)
        setUpViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // MARK: -myMethods
    func setUpViews(){
        changeNavVC()
        addSubViews()
        createTableView()
    }
    func addSubViews(){
        view.addSubview(tableView)
    }
    func createTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = dataSource
        createTableVieConstraint()
    }
    func createTableVieConstraint(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
    }

    // MARK: -DataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // when u select the row
        switch indexPath.row{
        case 0:
            let nvc = NViewController()
            self.navigationController?.pushViewController(nvc, animated: true)
        case 1:
            let zvc = ZViewController()
            self.navigationController?.pushViewController(zvc, animated: true)
        case 2:
            let qvc = QViewController()
            self.navigationController?.pushViewController(qvc, animated: true)
        case 3:
            let rvc = RViewController()
            self.navigationController?.pushViewController(rvc, animated: true)
        case 4:
            let cvc = CViewController()
            self.navigationController?.pushViewController(cvc, animated: true)
        case 5:
            let calcvc = CalcViewController()
            self.navigationController?.pushViewController(calcvc, animated: true)
        case 8:
            let mvc = MatrixViewController()
            self.navigationController?.pushViewController(mvc, animated: true)
        case 14:
            let wikivc = WikiViewController()
            self.navigationController?.pushViewController(wikivc, animated: true)
        default:
            break
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: -navController
    func changeNavVC(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.title = "My App"

    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        let selectionColor = UIView() as UIView
        selectionColor.layer.borderWidth = 1
        selectionColor.layer.borderColor = UIColor.systemGray5.cgColor
        selectionColor.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = selectionColor
        cell.separatorInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }
}
