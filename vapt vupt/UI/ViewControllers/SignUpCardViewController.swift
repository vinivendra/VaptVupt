import UIKit

class SignUpCardViewController: UIViewController {

	@IBAction func readyButtonPressed(_ sender: Any) {
		let _: LocationViewController =
			AppDelegate.singleton.changeRootViewController(
				toViewControllerNamed: "LocationViewController")
	}
}
