//
//  WikiViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 31.12.2022.
//

import UIKit
import WebKit

class WikiViewController: UIViewController, UINavigationControllerDelegate, WKUIDelegate  {
    
    let dataSource = MenuDataSource()
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        let myRequest = URLRequest(url: (URL(string:"https://ru.wikipedia.org")!))
        webView.load(myRequest)
    }
    func setupViews(){
        changeVC()
    }
    
    func changeVC(){
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
