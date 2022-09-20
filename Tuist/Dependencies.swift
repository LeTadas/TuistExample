import ProjectDescription

let dependencies = Dependencies(
	carthage: [
		.github(path: "airbnb/lottie-ios", requirement: .exact("3.4.0"))
	],
	platforms: [.iOS]
)
