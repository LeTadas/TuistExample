import UIKit

public class AppNavigator {
	private let navigationController: UINavigationController
	
	public init(_ navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	public func start() {
		let vc = MainViewController(MainListener(self))
		navigationController.setViewControllers([vc], animated: false)
	}
	
	private func showSettings() {
		let vc = SettingsViewController()
		navigationController.pushViewController(vc, animated: true)
	}
	
	class MainListener: MainEvents {
		private let parent: AppNavigator
		
		init(_ parent: AppNavigator) {
			self.parent = parent
		}
		
		func onSettingsTapped() {
			parent.showSettings()
		}
	}
}
