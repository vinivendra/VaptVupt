import UIKit

extension UIView {
	func fillWithSubview(_ view: UIView, margins: UIEdgeInsets = .zero) {
		view.translatesAutoresizingMaskIntoConstraints = false
		self.topAnchor.constraint(equalTo: view.topAnchor,
		                          constant: margins.top).isActive = true
		self.bottomAnchor.constraint(equalTo: view.bottomAnchor,
		                             constant: margins.bottom).isActive = true
		self.leadingAnchor.constraint(equalTo: view.leadingAnchor,
		                              constant: margins.left).isActive = true
		self.trailingAnchor.constraint(equalTo: view.trailingAnchor,
		                               constant: margins.right).isActive = true
	}

	// Set the file's owner to be the view's class
	// Set the view's nibView outlet to be the xib's root view
	@discardableResult
	func loadAndFillWithNib<T: UIView>() -> T? {
		guard let className = String(describing:
			type(of: self)).components(separatedBy: ".").last,
		let view = Bundle.main.loadNibNamed(className,
		                                    owner: self,
		                                    options: nil)?[0] as? T
			else
		{
			return nil
		}
		self.addSubview(view)
		self.fillWithSubview(view)
		return view
	}
}

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
