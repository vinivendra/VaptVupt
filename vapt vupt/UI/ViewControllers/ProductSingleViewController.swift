import UIKit

class ProductSingleViewController: UIViewController {
	@IBOutlet weak var productNameLabel: UILabel!
	@IBOutlet weak var productSizeLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var imageBackground: UIView! {
		didSet {
			imageBackground.layer.borderWidth = 1.0
			imageBackground.layer.borderColor = UIColor.lightGray.cgColor
		}
	}
	@IBOutlet weak var deleteButton: UIButton! {
		didSet {
			deleteButton.layer.borderWidth = 1.0
			deleteButton.layer.borderColor = UIColor.lightGray.cgColor
		}
	}
	@IBOutlet weak var amountLabel: UILabel!

	var cartProduct: CartProduct!

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Brigadeiro"
		// TODO: Use default (translated) back button item

		populate(withCartProduct: cartProduct)
	}

	func populate(withCartProduct cartProduct: CartProduct) {
		self.cartProduct = cartProduct

		imageView?.image = cartProduct.image
		productNameLabel?.text = cartProduct.completeName
		productSizeLabel?.text = cartProduct.completeSize

		updateAmountLabel()
	}

	// MARK: Actions
	func changeAmount(by change: Int) {
		if cartProduct.amount =~ 0...20 {
			cartProduct.amount += change
			updateAmountLabel()
		}
	}

	func updateAmountLabel() {
		amountLabel?.text = "\(cartProduct.amount)"
	}

	// MARK: IBActions
	@IBAction func plusButtonPressed(_ sender: Any) {
		changeAmount(by: 1)
	}

	@IBAction func minusButtonPressed(_ sender: Any) {
		changeAmount(by: -1)
	}

	@IBAction func deleteButtonPressed(_ sender: Any) {
		self.navigationController?.popViewController(animated: true)
	}
}
