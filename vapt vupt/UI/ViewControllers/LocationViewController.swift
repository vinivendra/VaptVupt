import UIKit

class LocationViewController: UIViewController {

	@IBAction func locationButtonPressed(_ sender: Any) {
		let alertController = UIAlertController(
			title: "Location",
			message: "Posso pegar sua localização?",
			preferredStyle: .alert)

		let action1 = UIAlertAction(title: "OK",
		                           style: .default,
		                           handler: nil)
		let action2 = UIAlertAction(title: "Nope",
		                           style: .default,
		                           handler: nil)

		alertController.addAction(action2)
		alertController.addAction(action1)

		self.present(alertController,
		             animated: true,
		             completion: nil)
	}

	@IBAction func imHereButtonPressed(_ sender: Any) {
	}
}
