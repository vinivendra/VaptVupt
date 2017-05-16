import UIKit

class TypeCodeViewController: UIViewController, UITextFieldDelegate,
AlertDelegate
{
	@IBOutlet weak var textField: UITextField!

	@IBOutlet weak var addProductView: AddProductView!

	@IBOutlet weak var blackView: UIView!

	override func viewDidLoad() {
		super.viewDidLoad()

		addProductView.alertDelegate = self

		textField.delegate = self

		hideAddProductView()
	}

	// MARK: Alert Delegate
	func didPressYes(_ sender: Any) {
		if sender as? AddProductView == addProductView {
			hideAddProductView()
			dismiss()
		}
	}

	func didPressNo(_ sender: Any) {
		if sender as? AddProductView == addProductView {
			hideAddProductView()
		}
	}

	// MARK: UI Text Field Delegate
	func textField(_ textField: UITextField,
	               shouldChangeCharactersIn range: NSRange,
	               replacementString string: String) -> Bool {
		if textField == self.textField {
			let currentText = textField.text ?? ""
			let start = currentText.index(currentText.startIndex,
			                              offsetBy: range.location)
			let end = currentText.index(start,
			                            offsetBy: range.length)
			let newText = currentText.replacingCharacters(in: start..<end,
			                                              with: string)
			if newText.characters.count >= 13 {
				showAddProductView()
			}
		}

		return true
	}

	// MARK: Actions
	func showAddProductView() {
		textField.resignFirstResponder()
		addProductView.isHidden = false
		blackView.isHidden = false
	}

	func hideAddProductView() {
		textField.becomeFirstResponder()
		addProductView.isHidden = true
		blackView.isHidden = true
	}

	func dismiss() {

	}

	// MARK: IBActions
	@IBAction func xButtonPressed(_ sender: Any) {
		dismiss()
	}
}
