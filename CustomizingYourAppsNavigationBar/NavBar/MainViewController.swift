/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The application's main (initial) view controller.
*/

import UIKit

class MainViewController: UITableViewController, UIActionSheetDelegate {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    /// Unwind action that is targeted by the demos which present a modal view controller, to return to the main screen.
    @IBAction func unwindToMainViewController(_ sender: UIStoryboardSegue) {
        tableView.deselectRow(at: tableView!.indexPathForSelectedRow!, animated: false)
    }
    
    // MARK: - Style AlertController
	
    /// User tapped the left 'Style' bar button item.
    /// - Tag: BarStyleExample
    @IBAction func styleAction(_ sender: UIBarButtonItem) {
        let title = NSLocalizedString("Choose a UIBarStyle:", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let defaultButtonTitle = NSLocalizedString("Default", comment: "")
        let blackOpaqueTitle = NSLocalizedString("Black Opaque", comment: "")
		
		let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)

		alertController.addAction(UIAlertAction(title: NSLocalizedString(cancelButtonTitle, comment: ""),
		                                        style: .cancel) { _ in })
		alertController.addAction(UIAlertAction(title: NSLocalizedString(defaultButtonTitle, comment: ""),
		                                        style: .default) { _ in
			self.navigationController!.navigationBar.barStyle = .default
		    self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            self.navigationController!.navigationBar.tintColor = nil
		})
		alertController.addAction(UIAlertAction(title: NSLocalizedString(blackOpaqueTitle, comment: ""),
		                                        style: .default) { _ in
            self.navigationController!.navigationBar.barStyle = .black
            self.navigationController!.navigationBar.isTranslucent = false
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
		})

        if let presentationController = alertController.popoverPresentationController {
            presentationController.permittedArrowDirections = .any
            presentationController.barButtonItem = sender
        }
		self.present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            // User tapped the "Custom Back Button Titles" row that does not use a segue.
            
            /** Users can quickly switch between different stack levels with a tap and hold on the back button. The sample shows this
                by pushing ten view controllers on the current navigation stack to demonstrate that back button titles can be customized
                for each view controller level in the stack.
            */
            func makeViewController(_ level: Int) -> UIViewController {
                let viewController = UIViewController()
                viewController.title = "Level \(level)"
                viewController.navigationItem.backButtonTitle = "\(level)"
                viewController.view.backgroundColor = .systemBackground
                return viewController
            }
            for level in 1..<10 {
                self.navigationController?.pushViewController(makeViewController(level), animated: false)
            }
            self.navigationController?.pushViewController(makeViewController(10), animated: true)
        }
    }

}
