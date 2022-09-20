
import Foundation
import ProjectDescription

extension ProjectEnvironment {
	
	public func createFrameworkTarget(
		name: String,
		folder: String? = nil,
		withResources: Bool = false,
		mainTargetScripts: [TargetScript] = [],
		dependencies: [TargetDependency] = [],
		testDependencies: [TargetDependency] = []
	) -> TargetDependency {
		
		var baseFolder = rootFolder
		
		if let folder = folder {
			baseFolder = "\(baseFolder)/\(folder)"
		} else {
			baseFolder = "\(baseFolder)/\(name)"
		}
		
		createDirectory(atPath: "\(baseFolder)/Sources")
		createDirectory(atPath: "\(baseFolder)/Tests")
		createDirectory(atPath: "\(baseFolder)/UITests")
		
		var resources: ResourceFileElements = []
		
		if withResources {
			createDirectory(atPath: "\(baseFolder)/Resources")
			resources = ["\(baseFolder)/Resources/**"]
		}
		
		register(
			Target(
				name: name,
				platform: .iOS,
				product: .framework,
				bundleId: "\(bundleId).\(name)",
				deploymentTarget: deploymentTarget,
				infoPlist: .default,
				sources: ["\(baseFolder)/Sources/**"],
				resources: resources,
				scripts: mainTargetScripts,
				dependencies: dependencies
			)
		)
		
		var testDependencies = testDependencies
		testDependencies += [.target(name: name)]
		
		register(
			Target(
				name: "\(name)Tests",
				platform: .iOS,
				product: .unitTests,
				bundleId: "\(bundleId).\(name)Tests",
				deploymentTarget: deploymentTarget,
				infoPlist: .default,
				sources: ["\(baseFolder)/Tests/**"],
				dependencies: testDependencies
			)
		)
		
		register(
			Target(
				name: "\(name)UITests",
				platform: .iOS,
				product: .uiTests,
				bundleId: "\(bundleId).\(name)UITests",
				deploymentTarget: deploymentTarget,
				infoPlist: .default,
				sources: ["\(baseFolder)/UITests/**"],
				dependencies: testDependencies
			)
		)
		
		return .target(name: name)
	}
}
