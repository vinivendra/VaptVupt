import UIKit

class PromotionsViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate
{
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self,
		                   forCellReuseIdentifier: "UITableViewCell")

		tableView.allowsSelection = false
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

		cell.textLabel?.text = "Promoção!! \(indexPath.row)"
		return cell
	}
}
