import UIKit
import Lottie
import Design

protocol MainEvents {
	func onSettingsTapped()
}

class MainViewController: UIViewController {
	
	private let listener: MainEvents
	
	//MARK: Views
	
	private let titleLabel: UILabel = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.text = UIStrings.Main.mainScreenTitle
		return view
	}()
	
	private let animationView: AnimationView = {
		let view = AnimationView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.animation = Lottie.coolTurkey
		view.loopMode = .loop
		return view
	}()
	
	private lazy var settingsButton: UIButton = {
		let view = UIButton()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.setTitle(UIStrings.Main.mainSettingsButtonTitle, for: .normal)
		view.setTitleColor(UIColor.systemBlue, for: .normal)
		
		view.addTarget(
			self,
			action: #selector(onSettingsTapped),
			for: .touchUpInside
		)
		
		return view
	}()
	
	//MARK: init
	
	init(_ listener: MainEvents) {
		self.listener = listener
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: Lifecycle
	
	override func loadView() {
		super.loadView()
		
		view.backgroundColor = .white
		view.addSubview(titleLabel)
		view.addSubview(animationView)
		view.addSubview(settingsButton)
		
		NSLayoutConstraint.activate(
			titleLabelConstraints +
			animationViewConstraints +
			settingsButtonConstraints
		)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		animationView.play()
	}
	
	//MARK: Listeners
	
	@objc private func onSettingsTapped(_ sender: UIButton) {
		listener.onSettingsTapped()
	}
	
	//MARK: Constraints
	
	private lazy var titleLabelConstraints: [NSLayoutConstraint] = {
		[
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		]
	}()
	
	private lazy var animationViewConstraints: [NSLayoutConstraint] = {
		[
			animationView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -16),
			animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			animationView.widthAnchor.constraint(equalToConstant: 200),
			animationView.heightAnchor.constraint(equalToConstant: 200)
		]
	}()
	
	private lazy var settingsButtonConstraints: [NSLayoutConstraint] = {
		[
			settingsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
			settingsButton.widthAnchor.constraint(equalToConstant: 200),
			settingsButton.heightAnchor.constraint(equalToConstant: 50),
			settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		]
	}()
}

