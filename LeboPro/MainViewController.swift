//
//  MainViewController.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 18.03.2023.
//

import UIKit

protocol TransmissionOfInformationDelegate {
    func updata(user: String)
}


class MainViewController: UIViewController {
    
    
   
    
    private let user = User.getUser()
    
    private lazy var userNameTF: UITextField = {
        createTextField(textColor: .black, textAlignment: .left, placeholder: "User name", isSecureTextEntry: false)
    }()

    
    private lazy var passwordTF: UITextField = {
       createTextField(textColor: .black, textAlignment: .left, placeholder: "Password", isSecureTextEntry: true)
    }()
    
    private lazy var userNameButton: UIButton = {
        createButton(withTitle: "Tap me 🌚", andColor: .darkGray, action: UIAction { _ in
            self.showAlert(title: "My login is your name!", message: self.user.userName)
        })
    }()
    
    
    private lazy var passwordButton: UIButton = {
        createButton(withTitle: "Tap me also 🌚", andColor: .darkGray, action: UIAction { _ in
            self.showAlert(title: "My password is", message: self.user.password)
        })
    }()
    
    private lazy var returnButton: UIButton = {
        createButton(withTitle: "Return", andColor: .black, action: UIAction { _ in
            if self.passwordTF.text == self.user.password {
                self.goToSettingVC()
            } else {
                self.showAlert(title: "Sorry", message: "You entered the wrong username or password")
            }
        })
    }()
    
    private let verticalStackViewTF: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 30
        verticalStackView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    private let horizontalStackViewButton: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .horizontal
        verticalStackView.spacing = 20
        verticalStackView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return verticalStackView
    }()
    
    private let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 30
        verticalStackView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        view.addSubview(verticalStackViewTF)
        view.addSubview(verticalStackView)
        addElementInStack()
        setConstraints()
        
    }


    private func addElementInStack() {
        verticalStackViewTF.addArrangedSubview(userNameTF)
        verticalStackViewTF.addArrangedSubview(passwordTF)
        horizontalStackViewButton.addArrangedSubview(userNameButton)
        horizontalStackViewButton.addArrangedSubview(passwordButton)
        verticalStackView.addArrangedSubview(horizontalStackViewButton)
        verticalStackView.addArrangedSubview(returnButton)
    }
    
    private func setConstraints() {
        passwordButton.translatesAutoresizingMaskIntoConstraints = false
        userNameButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            verticalStackViewTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            verticalStackViewTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            verticalStackViewTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            verticalStackViewTF.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -600),
            
            verticalStackView.topAnchor.constraint(equalTo: verticalStackViewTF.bottomAnchor, constant: 90),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            verticalStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -600),
    
            passwordButton.widthAnchor.constraint(equalToConstant: 170),
            userNameButton.widthAnchor.constraint(equalToConstant: 170),
            returnButton.widthAnchor.constraint(equalToConstant: 170)
            
        ])
    }
    
    private func createTextField(textColor: UIColor,textAlignment: NSTextAlignment, placeholder: String, isSecureTextEntry: Bool) -> UITextField {
        let textField = UITextField()
        textField.textColor = textColor
        textField.textAlignment = textAlignment
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.enablesReturnKeyAutomatically = true
        textField.isSecureTextEntry = isSecureTextEntry
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func createButton(withTitle title: String, andColor color: UIColor, action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = color
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
    
    private func goToSettingVC() {
        let settingVC = SettingViewController()

        navigationController?.pushViewController(settingVC, animated: true)
        settingVC.delegate = self
    }
}

extension MainViewController {
    private func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



extension MainViewController: TransmissionOfInformationDelegate {
    func updata(user: String) {
        userNameTF.text = user
    }
   
}
