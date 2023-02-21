//
//  MenuDataSource.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 29.11.2022.
//

import UIKit
import Foundation

class MenuDataSource: NSObject, UITableViewDataSource {
    fileprivate var menu: [String] = []
    
    override init() {
        super.init()
        
        let menuJSONURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Menu", ofType: "json")!)
        do {
            let menuJSONData = try Data(contentsOf: menuJSONURL)
            menu = try JSONDecoder().decode([String].self, from: menuJSONData)
        } catch {
            //..
        }
    }
    
    @objc func indexMenu(index: Int) -> String {
        return menu[index]
    }
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flavor = menu[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = flavor
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset = UIEdgeInsets(top: 100, left: 10, bottom: 0, right: 0)
        return cell
    }
    
}
