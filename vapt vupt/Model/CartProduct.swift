import UIKit

struct CartProduct {
	let product: Product
	var amount: Int
}

extension CartProduct {
	var completeName: String {
		return product.completeName
	}
	var shortName: String {
		return product.shortName
	}
	var completeSize: String {
		return product.completeSize
	}
	var shortSize: String {
		return product.shortSize
	}
	var image: UIImage {
		return product.image
	}
}

extension CartProduct {
	static let brigadeiro = CartProduct(product: Product.brigadeiro, amount: 2)
}
