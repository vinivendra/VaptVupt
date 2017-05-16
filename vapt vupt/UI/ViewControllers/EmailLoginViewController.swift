import UIKit

class EmailLoginViewController: UIViewController {

	@IBAction func continueButtonPressed(_ sender: Any) {
		let _: LocationViewController =
		AppDelegate.singleton.changeRootViewController(
			toViewControllerNamed: "LocationViewController")
	}
}
