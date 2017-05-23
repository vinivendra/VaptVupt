import UIKit

protocol ModalDelegate: class {
	func dismissModalViewController()
}

protocol ModalDelegating: class {
	weak var modalDelegate: ModalDelegate? { get set }
}
