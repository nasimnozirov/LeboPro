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
        button.setTitle("Вернуться", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emojiLabel: UILabel = {
       return aditLabel(fond: UIFont.systemFont(ofSize: 60), text: "🌚💋👀")
    }()
    
   private lazy var userLabel: UILabel = {
       print(userName)
       return aditLabel(fond: UIFont.systemFont(ofSize: 30), text:" Welcome \(userName)!")
    }()
    
    private let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        verticalStackView.backgroundColor = .black
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
        dismissButton.addTarget(self, action: #selector(ouch), for: .touchUpInside)
    }
    
    // Mark: - Private function
    private func addElementInStack() {
        verticalStackView.addArrangedSubview(userLabel)
        verticalStackView.addArrangedSubview(emojiLabel)
    }
    
    
    private func aditLabel(fond: UIFont, text: String) -> UILabel {
        let label = UILabel()
        label.font = fond
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .center
        label.text = text
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
    @objc func ouch() {
     dismiss(animated: true)
    }

}


