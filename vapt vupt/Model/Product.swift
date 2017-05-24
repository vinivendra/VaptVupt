import UIKit

struct Product {
	let completeName: String
	let shortName: String
	let completeSize: String
	let shortSize: String
	let image: UIImage

	init(completeName: String,
	     completeSize: String,
	     imageNamed imageName: String) {
		self.completeName = completeName
		self.completeSize = completeSize

		self.shortName = completeName.components(separatedBy: " ").first!
		self.shortSize = completeName.components(separatedBy: " ").last!

		self.image = UIImage(named: imageName)!
	}
}

// MARK: temp
extension Product {
	static let brigadeiro = Product(
		completeName: "Brigadeiro Nestlé com Granulado",
		completeSize: "Lata de 300ml",
		imageNamed: "brigadeiro")
}
