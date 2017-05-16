import UIKit

class AddProductView: UIView {
	@IBOutlet var nibView: UIView!

	weak var alertDelegate: AlertDelegate?

	func commonInit() {
		loadAndFillWithNib()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	@IBAction func cancelButtonPressed(_ sender: Any) {
		alertDelegate?.didPressNo(self)
	}

	@IBAction func okButtonPressed(_ sender: Any) {
		alertDelegate?.didPressYes(self)
	}
}
