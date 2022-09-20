
import ProjectDescription

extension ProjectEnvironment {
	
	public func createAppTarget(
		name: String,
		rootFolder: String? = nil,
		folder: String? = nil,
		productName: String,
		dependencies: [TargetDependency] = []
	) {
		
		let baseFolder = baseFolderFrom(
			rootFolder: rootFolder,
			folder: folder,
			name: name
		)
		
		createDirectory(atPath: "\(baseFolder)/Sources")
		createDirectory(atPath: "\(baseFolder)/Resources")
		
		register(
			Target(
				name: name,
				platform: .iOS,
				product: .app,
				productName: productName,
				bundleId: "\(bundleId)",
				deploymentTarget: deploymentTarget,
				infoPlist: .extendingDefault(with: infoPlist()),
				sources: ["\(baseFolder)/Sources/**"],
				resources: ["\(baseFolder)/Resources/**"],
				dependencies: dependencies
			)
		)
	}
	
	private func infoPlist() -> [String: InfoPlist.Value] {
		var versionName = "1.0"
		
		if case let .string(environmentVersionName) = Environment.appVersion {
			versionName = environmentVersionName
		}
		
		return [
			"CFBundleShortVersionString": .string(versionName),
			"CFBundleVersion": "0",
			"UIMainStoryboardFile": "",
			"UILaunchStoryboardName": "LaunchScreen",
			"UIUserInterfaceStyle": "Light",
			"UIApplicationSceneManifest": .dictionary([
				"UIApplicationSupportsMultipleScenes": false,
				"UISceneConfigurations": .dictionary([
					"UIWindowSceneSessionRoleApplication": .array([
						.dictionary([
							"UISceneConfigurationName": "Default Configuration",
							"UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
						])
					])
					
				])
			])
		]
	}
}



