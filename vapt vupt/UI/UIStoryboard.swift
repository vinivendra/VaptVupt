import UIKit

extension UIStoryboard {
	static func instantiateViewController<T: UIViewController>() -> T {
		let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
		return mainStoryboard.instantiateViewController()
	}

	func instantiateViewController<T: UIViewController>() -> T {
		let className = String(type: T.self)
		let newViewController = self.instantiateViewController(
			withIdentifier: className) as! T //swiftlint:disable:this force_cast
		return newViewController
	}
}
