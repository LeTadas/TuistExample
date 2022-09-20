import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let environment = ProjectEnvironment(
	rootFolder: "iOS",
	bundleId: "com.TuistExample",
	deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad])
)

let design = environment.createFrameworkTarget(
	name: "Design",
	folder: "UI/Design",
	withResources: true,
	dependencies: [
		.external(name: "Lottie")
	]
)

let ui = environment.createFrameworkTarget(
	name: "UI",
	withResources: true,
	dependencies: [
		design
	]
)

let app: () = environment.createAppTarget(
	name: "App",
	productName: "TuistExample",
	dependencies: [
		ui
	]
)

let project = Project(
	name: "TuistExample",
	settings: .settings(
		base: SettingsDictionary()
	),
	targets: environment.registeredTargets,
	resourceSynthesizers: [
		.strings(),
		.custom(
			name: "LottieAnimation",
			parser: .json,
			extensions: ["json"]
		)
	]
)
