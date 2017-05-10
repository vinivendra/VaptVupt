import UIKit

class LoginViewController: UIViewController {

	func switchToLocationViewController() {
		let _: LocationViewController =
		AppDelegate.singleton.changeRootViewController(
			toViewControllerNamed: "LocationViewController")
	}

	@IBAction func facebookButtonPressed(_ sender: Any) {
		switchToLocationViewController()
	}
	@IBAction func googleButtonPressed(_ sender: Any) {
		switchToLocationViewController()
	}
}
