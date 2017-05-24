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
		let newViewController: UIViewController
		switch segue.identifier! {
		case "showTypeCodeVCSegue":
			let newVC: TypeCodeViewController =
				UIStoryboard.instantiateViewController()
			newViewController = newVC
		case "showPromotionsVCSegue":
			let newVC: PromotionsViewController =
				UIStoryboard.instantiateViewController()
			newViewController = newVC
		case "showMyProductsVCSegue":
			let newVC: MyProductsViewController =
				UIStoryboard.instantiateViewController()
			newViewController = newVC
		case "showPreferencesVCSegue":
			let newVC: PreferencesViewController =
				UIStoryboard.instantiateViewController()
			newViewController = newVC
		default:
			assertionFailure("Unsupported segue leaving Scan View Controller")
			return
		}

		//swiftlint:disable:next force_cast
		let navViewController = segue.destination as! UINavigationController

		newViewController.navigationItem.rightBarButtonItem =
			UIBarButtonItem(title: "X",
							style: .plain,
							target: self,
							action: #selector(dismissModalViewController))
		navViewController.setViewControllers([newViewController],
		                                     animated: false)

		// Give the view controller a way to dismiss itself if it wants to
		if let modalDelegatingVC = newViewController as? ModalDelegating {
			modalDelegatingVC.modalDelegate = self
		}
	}
}
