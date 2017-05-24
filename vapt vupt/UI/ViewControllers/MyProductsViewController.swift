import UIKit

class MyProductsViewController: UIViewController, UITableViewDataSource,
	UITableViewDelegate
{
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self,
		                   forCellReuseIdentifier: "UITableViewCell")
	}

	// MARK: UI Table View Data Source
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView,
	               numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView,
	               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = "UITableViewCell"
		let cell = tableView.dequeueReusableCell(
			withIdentifier: reuseIdentifier) ??
			UITableViewCell(style: .value2, reuseIdentifier: reuseIdentifier)

		let cartProduct = CartProduct.brigadeiro
		cell.textLabel?.text = "\(cartProduct.shortName) - " +
			"\(cartProduct.shortSize)"
		cell.detailTextLabel?.text = "x\(cartProduct.amount)"
		return cell
	}

	// MARK: UI Table View Delegate
	func tableView(_ tableView: UITableView,
	               didSelectRowAt indexPath: IndexPath) {
		let productSingleViewController: ProductSingleViewController =
			UIStoryboard.instantiateViewController()
		productSingleViewController.populate(
			withCartProduct: CartProduct.brigadeiro)
		navigationController?.pushViewController(productSingleViewController,
		                                         animated: true)
	}
}
