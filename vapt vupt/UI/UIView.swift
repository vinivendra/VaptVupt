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

	/// In order for this to work: set the file's owner in the xib to be the
	/// view's class, and set the view's nibView outlet to be the xib's root
	/// view. Call this method in every init.
	@discardableResult
	func loadAndFillWithNib<T: UIView>() -> T? {
		let className = String(typeOf: self)
		guard let view = Bundle.main.loadNibNamed(className,
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

protocol AlertDelegate: class {
	func didPressYes(_ sender: Any)
	func didPressNo(_ sender: Any)
}
