/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Demonstrates applying a custom background to a navigation bar.
*/

import UIKit

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

// MARK: -

class CustomAppearanceViewController: UITableViewController {

    @IBOutlet var backgroundSwitcher: UISegmentedControl!

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .landscape]
    }
    
	/// The data source is an array of city names, populated from Cities.json.
	let dataSource = CitiesDataSource()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.dataSource = dataSource
		
        // Place the background switcher in the toolbar.
        let backgroundSwitcherItem = UIBarButtonItem(customView: backgroundSwitcher)
        toolbarItems = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            backgroundSwitcherItem,
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ]
        
        applyImageBackgroundToTheNavigationBar()
    }
	
    /// Configures the navigation bar to use an image as its background.
    /// - Tag: BackgroundImageExample
    func applyImageBackgroundToTheNavigationBar() {
   
        guard let bounds = navigationController?.navigationBar.bounds else { return }
        
        var backImageForDefaultBarMetrics =
            UIImage.gradientImage(bounds: bounds,
                                  colors: [UIColor.systemBlue.cgColor, UIColor.systemFill.cgColor])
        var backImageForLandscapePhoneBarMetrics =
            UIImage.gradientImage(bounds: bounds,
                                  colors: [UIColor.systemTeal.cgColor, UIColor.systemFill.cgColor])
        
        /** Both of the above images are smaller than the navigation bar's size.
            To enable the images to resize gracefully while keeping their content pinned to the bottom right corner of the bar, the images are
            converted into resizable images width edge insets extending from the bottom up to the second row of pixels from the top, and from the
            right over to the second column of pixels from the left. This results in the topmost and leftmost pixels being stretched when the images
            are resized. Not coincidentally, the pixels in these rows/columns are empty.
         */
        backImageForDefaultBarMetrics =
            backImageForDefaultBarMetrics.resizableImage(
                withCapInsets: UIEdgeInsets(top: 0,
                                            left: 0,
                                            bottom: backImageForDefaultBarMetrics.size.height - 1,
                                            right: backImageForDefaultBarMetrics.size.width - 1))
        backImageForLandscapePhoneBarMetrics =
            backImageForLandscapePhoneBarMetrics.resizableImage(
                withCapInsets: UIEdgeInsets(top: 0,
                                            left: 0,
                                            bottom: backImageForLandscapePhoneBarMetrics.size.height - 1,
                                            right: backImageForLandscapePhoneBarMetrics.size.width - 1))
        
        /** Use the appearance proxy to customize the appearance of UIKit elements. However changes made to an element's appearance
            proxy do not affect any existing instances of that element currently in the view hierarchy. Normally this is not an issue because you
            will likely be performing your appearance customizations in -application:didFinishLaunchingWithOptions:.
            However, this example allows you to toggle between appearances at runtime which necessitates applying appearance customizations
            directly to the navigation bar.
        */
        
        // Uncomment this line to use the appearance proxy to customize the appearance of UIKit elements.
        // let navigationBarAppearance =
        //      UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])

        /** The bar metrics associated with a background image determine when it is used.
            Use the background image associated with the Default bar metrics when a more suitable background image can't be found.
         
            The shorter variant of the navigation bar, that is used on iPhone when in landscape, uses the background image associated
            with the LandscapePhone bar metrics.
         */

        let navBar = self.navigationController!.navigationBar
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundImage = backImageForDefaultBarMetrics
        
        let compactAppearance = standardAppearance.copy()
        compactAppearance.backgroundImage = backImageForLandscapePhoneBarMetrics
        
        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
        navBar.compactAppearance = compactAppearance
        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
            navBar.compactScrollEdgeAppearance = compactAppearance
        }
    }
    
    /// Configures the navigation bar to use a custom color as its background. The navigation bar remains translucent.
    func applyBarTintColorToTheNavigationBar() {
        /*  Be aware when selecting a barTintColor for a translucent bar that
            the tint color will be blended with the content passing under
            the translucent bar.  See QA1808 for more information.
            <https://developer.apple.com/library/ios/qa/qa1808/_index.html>
		*/
		let darkendBarTintColor = #colorLiteral(red: 0.5541667552, green: 0.7134873905, blue: 0.5476607554, alpha: 1)
	
        /** Use the appearance proxy to customize the appearance of UIKit elements.
            However changes made to an element's appearance proxy do not affect any existing instances of that element currently
    		in the view hierarchy. Normally this is not an issue because you will likely be performing your appearance customizations in
     		-application:didFinishLaunchingWithOptions:. However, this example allows you to toggle between appearances at runtime
            which necessitates applying appearance customizations directly to the navigation bar.
		*/
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = darkendBarTintColor
        
        let compactAppearance = standardAppearance.copy()

        let navBar = self.navigationController!.navigationBar
        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
        navBar.compactAppearance = compactAppearance // For iPhone small navigation bar in landscape.
        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
            navBar.compactScrollEdgeAppearance = compactAppearance
        }
    }
	
    // MARK: - Background Switcher
    
    @IBAction func configureNewNavBarBackground(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // Transparent Background
            applyImageBackgroundToTheNavigationBar()
        case 1: // Colored
            applyBarTintColorToTheNavigationBar()
        default:
            break
        }
    }

}
