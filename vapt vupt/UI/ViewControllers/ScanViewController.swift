import UIKit

class ScanViewController: UIViewController, AlertDelegate, ModalDelegate {
	var isShowingAlertView = false

	@IBOutlet weak var addProductView: AddProductView!

	override func viewDidLoad() {
		super.viewDidLoad()

		addProductView.alertDelegate = self

		hideAddProductView()
	}

	// MARK: Alert Delegate
	func didPressYes(_ sender: Any) {
		if sender as? AddProductView == addProductView {
			hideAddProductView()
		}
	}

	func didPressNo(_ sender: Any) {
		if sender as? AddProductView == addProductView {
			hideAddProductView()
		}
	}

	// MARK: Modal Delegate
	func dismissModalViewController() {
		self.dismiss(animated: true)
	}

	// MARK: Actions
	func showAddProductView() {
		addProductView.isHidden = false
	}

	func hideAddProductView() {
		addProductView.isHidden = true
	}

	// MARK: IBActions
	@IBAction func scanButtonPressed(_ sender: Any) {
		showAddProductView()
	}

	// MARK: Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showTypeCodeVCSegue",
			let typeCodeVC = segue.destination as? TypeCodeViewController {
			typeCodeVC.modalDelegate = self
		}
	}
}
