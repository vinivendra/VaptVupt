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
		// Create the new view controller instance to insert into the given 
		// navVC
		var newViewController: UIViewController? = nil
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if segue.identifier == "showTypeCodeVCSegue" {
			newViewController = storyboard.instantiateViewController(
				withIdentifier: "TypeCodeViewController")
		} else if segue.identifier == "showPromotionsVCSegue" {
			newViewController = storyboard.instantiateViewController(
				withIdentifier: "PromotionsViewController")
		} else if segue.identifier == "showMyProductsVCSegue" {
			newViewController = storyboard.instantiateViewController(
				withIdentifier: "MyProductsViewController")
		}

		// Ensure we created the view controller successfully
		guard let newVC = newViewController,
			let navViewController = segue.destination as? UINavigationController
			else {
				assertionFailure(
					"Failed to instantiate view controller from storyboard")
				return
		}

		newVC.navigationItem.rightBarButtonItem =
			UIBarButtonItem(title: "X",
							style: .plain,
							target: self,
							action: #selector(dismissModalViewController))
		navViewController.setViewControllers([newVC], animated: false)

		// Give the view controller a way to dismiss itself if it wants to
		if let modalDelegatingVC = newVC as? ModalDelegating {
			modalDelegatingVC.modalDelegate = self
		}
	}
}
