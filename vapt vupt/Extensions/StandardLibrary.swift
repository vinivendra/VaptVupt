// MARK: Range
infix operator =~: ComparisonPrecedence

extension Range {
	static func =~ (value: Bound, range: Range) -> Bool {
		return value >= range.lowerBound && value < range.upperBound
	}
}

extension ClosedRange {
	static func =~ (value: Bound, range: ClosedRange) -> Bool {
		return value >= range.lowerBound && value <= range.upperBound
	}
}

// MARK: String
extension String {
	init<T>(typeOf instance: T) {
		let typeName = String(describing:
			type(of: instance)).components(separatedBy: ".").last!
		self.init(stringLiteral: typeName)
	}

	init<T>(type class: T.Type) {
		let typeName =
			String(describing: T.self).components(separatedBy: ".").last!
		self.init(stringLiteral: typeName)
	}
}
