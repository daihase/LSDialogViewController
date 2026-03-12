import UIKit
import LSDialogViewController

class ViewController: UIViewController {
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])

        let patterns: [(String, LSAnimationPattern)] = [
            ("Fade-In / Fade-Out", .fadeInOut),
            ("Zoom-In / Zoom-Out", .zoomInOut),
            ("Slide-Bottom / Slide-Bottom", .slideBottomBottom),
            ("Slide-Bottom / Slide-Top", .slideBottomTop),
            ("Slide-Left / Slide-Left", .slideLeftLeft),
            ("Slide-Left / Slide-Right", .slideLeftRight),
            ("Slide-Top / Slide-Top", .slideTopTop),
            ("Slide-Top / Slide-Bottom", .slideTopBottom),
            ("Slide-Right / Slide-Right", .slideRightRight),
            ("Slide-Right / Slide-Left", .slideRightLeft),
        ]

        for (title, pattern) in patterns {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(red: 0.48, green: 0.61, blue: 0.72, alpha: 1.0)
            button.layer.cornerRadius = 5
            button.heightAnchor.constraint(equalToConstant: 34).isActive = true
            button.tag = pattern.rawValue
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        guard let pattern = LSAnimationPattern(rawValue: sender.tag) else { return }
        showDialog(pattern)
    }

    private func showDialog(_ animationPattern: LSAnimationPattern) {
        let dialogVC = CustomDialogViewController()
        dialogVC.onClose = { [weak self] in
            self?.dismissDialogViewController(.fadeInOut)
        }
        presentDialogViewController(dialogVC, animationPattern: animationPattern)
    }
}
