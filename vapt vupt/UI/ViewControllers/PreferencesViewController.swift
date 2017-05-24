import UIKit

class PreferencesViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate {
	@IBOutlet weak var tableView: UITableView!

	// MARK: UI Table View Data Source
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}

	func tableView(_ tableView: UITableView,
	               numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0: return 1
		case 1: return 3
		case 2: return 2
		default: return 0
		}
	}

	func tableView(_ tableView: UITableView,
	               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let reuseIdentifier = "Header Cell"
			let cell = tableView.dequeueReusableCell(
				withIdentifier: reuseIdentifier) ??
				UITableViewCell(style: .subtitle,
				                reuseIdentifier: reuseIdentifier)

			cell.textLabel?.text = "Luis da silva"
			return cell
		case 1:
			let reuseIdentifier = "Profile Cell"
			let cell = tableView.dequeueReusableCell(
				withIdentifier: reuseIdentifier) ??
				UITableViewCell(style: .subtitle,
				                reuseIdentifier: reuseIdentifier)
			switch indexPath.row {
			case 0: cell.textLabel?.text = "email: luis.da.silva@gmail.com"
			case 1: cell.textLabel?.text = "nasc.: 11/11/1990"
			case 2: cell.textLabel?.text = "telefone: 11 98765 4321"
			default: break
			}
			return cell
		case 2:
			let reuseIdentifier = "Credit Card Cell"
			let cell = tableView.dequeueReusableCell(
				withIdentifier: reuseIdentifier) ??
				UITableViewCell(style: .subtitle,
				                reuseIdentifier: reuseIdentifier)
			cell.textLabel?.text = "Master card 1341243..."
			return cell
		default:
			assertionFailure("Section \(indexPath.section) not present in " +
				"table view")
			return UITableViewCell()
		}
	}

	func tableView(_ tableView: UITableView,
	               titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0: return "¯\\_(ツ)_/¯"
		case 1: return "perfil"
		case 2: return "cartões de crédito"
		default:
			assertionFailure("Section \(section) not present in table view")
			return ""
		}
	}

	func tableView(_ tableView: UITableView,
	               heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0: return tableView.rowHeight
		case 1: return tableView.rowHeight
		case 2: return 200
		default:
			assertionFailure("Section \(indexPath.section) not present in " +
				"table view")
			return 0
		}
	}
}
