import UIKit
import Design

class SettingsViewController: UIViewController {
	
	//MARK: Views
	
	private let titleLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.text = UIStrings.Settings.settingsScreenTitle
		return view
	}()
	
	//MARK: Lifecycle
	
	override func loadView() {
		super.loadView()
		
		view.backgroundColor = .white
		view.addSubview(titleLabel)
		
		NSLayoutConstraint.activate(
			titleLabelConstraints
		)
	}
	
	//MARK: Constraints
	
	private lazy var titleLabelConstraints: [NSLayoutConstraint] = {
		[
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		]
	}()
}

