/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Demonstrates attaching a UIMenu to a UIBarButtonItem.
*/

import UIKit

class BarButtonMenu: UIViewController {
    
    @IBOutlet var optionsBarItem: UIBarButtonItem!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func menuHandler(action: UIAction) {
        Swift.debugPrint("Menu handler: \(action.title)")
    }

/// - Tag: MenuExample
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: NSLocalizedString("Copy", comment: ""), image: UIImage(systemName: "doc.on.doc"), handler: menuHandler),
            UIAction(title: NSLocalizedString("Rename", comment: ""), image: UIImage(systemName: "pencil"), handler: menuHandler),
            UIAction(title: NSLocalizedString("Duplicate", comment: ""), image: UIImage(systemName: "plus.square.on.square"), handler: menuHandler),
            UIAction(title: NSLocalizedString("Move", comment: ""), image: UIImage(systemName: "folder"), handler: menuHandler)
        ])
        optionsBarItem.menu = barButtonMenu
    }
    
}
