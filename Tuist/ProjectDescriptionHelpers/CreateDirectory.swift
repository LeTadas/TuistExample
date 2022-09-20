import Foundation

public func createDirectory(atPath path: String) {
	try! FileManager.default.createDirectory(
		atPath: path,
		withIntermediateDirectories: true,
		attributes: nil
	)
}
