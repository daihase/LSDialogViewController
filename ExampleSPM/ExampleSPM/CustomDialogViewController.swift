import UIKit

class CustomDialogViewController: UIViewController {
    var onClose: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.22, green: 0.53, blue: 0.71, alpha: 1.0)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.bounds.size = CGSize(
            width: UIScreen.main.bounds.width * 0.8,
            height: UIScreen.main.bounds.height * 0.6
        )

        let label = UILabel()
        label.text = "This is a Sample Dialog."
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.backgroundColor = UIColor(red: 0.37, green: 0.70, blue: 1.0, alpha: 1.0)
        closeButton.layer.cornerRadius = 10
        closeButton.clipsToBounds = true
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            closeButton.heightAnchor.constraint(equalToConstant: 34),
        ])
    }

    @objc private func closeTapped() {
        onClose?()
    }
}
