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
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "UITableViewCell") ??
			UITableViewCell()

		cell.textLabel?.text = "Bridageiro - 300ml"
		cell.detailTextLabel?.text = "x\(indexPath.row)"
		return cell
	}
}
