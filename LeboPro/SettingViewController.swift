//
//  SettingViewController.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 27.03.2023.
//

import UIKit

// Mark: - Class SettingViewController
class SettingViewController: UIViewController {
    
    // Mark: - Public property
    var userName = ""
    
    // Mark: - Public property
    private var dismissButton: UIButton = {
      lazy var button = UIButton()
        button.setTitle("GO", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.800, green: 0.500, blue: 0.900, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emojiLabel: UILabel = {
        aditLabel(fond: UIFont.systemFont(ofSize: 60))
    }()
    
   private lazy var userLabel: UILabel = {
        aditLabel(fond: UIFont.systemFont(ofSize: 30))
    }()
    
    private let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.backgroundColor = .gray
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    // Mark: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(verticalStackView)
        view.addSubview(dismissButton)
        addElementInStack()
        fixToConstraint()
        dismissButton.addTarget(self, action: #selector(touch), for: .touchUpInside)
        emojiLabel.text = "🌚💋👀"
    }
    
    // Mark: - Private function
    private func addElementInStack() {
        verticalStackView.addArrangedSubview(userLabel)
        verticalStackView.addArrangedSubview(emojiLabel)
    }
    
    
    private func aditLabel(fond: UIFont) -> UILabel {
        let label = UILabel()
        label.font = fond
        label.backgroundColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }
    
    private func fixToConstraint() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            verticalStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -500),
            
            dismissButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 150),
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 124),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -124),
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
    
    // Mark: -  #selector function
    @objc func touch() {
     dismiss(animated: true)
    }

}

// Mark: - extension  SettingViewController: TransmissionOfInformationDelegate 
extension SettingViewController: TransmissionOfInformationDelegate {
    func upData(user: String) {
        userName = user
        userLabel.text = "Hi \(userName) welcome"
    }
   
}
