import UIKit

class ScanViewController: UIViewController {
	var isShowingAlertView = false

	@IBOutlet weak var addProductView: AddProductView!

	override func viewDidLoad() {
		super.viewDidLoad()
		hideAddProductView()
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
}
