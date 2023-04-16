//
//  SettingViewController.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 27.03.2023.
//

import UIKit


class SettingViewController: UIViewController {
    
    var mainVC: MainViewController?
    
    var userName = ""
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
    
    @objc func touch() {
       
        mainVC?.userNameTF.text = ""
        mainVC?.passwordTF.text = ""
     dismiss(animated: true)
    }

}


extension SettingViewController: TransmissionOfInformationDelegate {
    func updata(user: String) {
        userName = user
        userLabel.text = "Hi \(userName) welcome"
    }
   
}
