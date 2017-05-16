import UIKit

class AddProductView: UIView {
	@IBOutlet var nibView: UIView!

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
}
