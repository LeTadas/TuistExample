import ProjectDescription

public class ProjectEnvironment {
	
	let rootFolder: String
	let bundleId: String
	let deploymentTarget: DeploymentTarget
	
	public var registeredTargets: [Target] = []
	
	func register(_ target: Target) {
		registeredTargets.append(target)
	}
	
	public init(
		rootFolder: String,
		bundleId: String,
		deploymentTarget: DeploymentTarget
	) {
		self.rootFolder = rootFolder
		self.bundleId = bundleId
		self.deploymentTarget = deploymentTarget
	}
	
	func baseFolderFrom(
		rootFolder: String?,
		folder: String?,
		name: String
	) -> String {
		let rootFolder = rootFolder ?? self.rootFolder
		
		var baseFolder = rootFolder
		
		if let folder = folder {
			baseFolder = "\(baseFolder)/\(folder)"
		} else {
			baseFolder = "\(baseFolder)/\(name)"
		}
		
		return baseFolder
	}
}
