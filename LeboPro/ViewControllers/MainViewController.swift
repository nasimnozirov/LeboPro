//
//  MainViewController.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 18.03.2023.
//

import UIKit

// Mark: - Protocol delegate
protocol TransmissionOfInformationDelegate {
    func upData(user: String)
}

// Mark: - Class MainViewController

class MainViewController: UIViewController {
    
    // Mark: - Public property
    var scrollView: UIScrollView?
    var delegate: TransmissionOfInformationDelegate?
    
    // Mark: - Public property
    private let user = User.getUser()
    
    private lazy var userNameTF: UITextField = {
        createTextField(
            textColor: .black,
            textAlignment: .left,
            placeholder: "Имя пользователя",
            isSecureTextEntry: false,
            returnKeyType: .next
        )
    }()
    
    private lazy var passwordTF: UITextField = {
        createTextField(
            textColor: .black,
            textAlignment: .left,
            placeholder: "Пароль",
            isSecureTextEntry: true,
            returnKeyType: .done
        )
    }()
    
    private lazy var userNameButton: UIButton = {
        createButton(withTitle: "Зарегистрироваться", action: UIAction { _ in
            self.modalTransitionInRegisterVC()
        })
    }()
    
    
    private lazy var passwordButton: UIButton = {
        createButton(withTitle: "Пароль", action: UIAction { _ in
            self.showAlert(title: "My password is", message: self.user.password)
        })
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Продолжить", for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.addTarget(self, action: #selector(goToSettingVC), for: .touchUpInside)
        return button
    }()
    
    private let verticalStackViewTF: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 30
        verticalStackView.backgroundColor = .black
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    private let horizontalStackViewButton: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.axis = .horizontal
        verticalStackView.spacing = 20
        verticalStackView.backgroundColor = .black
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return verticalStackView
    }()
    
    // Mark: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubview()
        addElementInStack()
        setConstraints()
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }
    // Mark: - Private function
    private func addSubview() {
        view.addSubview(verticalStackViewTF)
        view.addSubview(returnButton)
        view.addSubview(horizontalStackViewButton)
    }
    
    private func addElementInStack() {
        verticalStackViewTF.addArrangedSubview(userNameTF)
        verticalStackViewTF.addArrangedSubview(passwordTF)
        horizontalStackViewButton.addArrangedSubview(userNameButton)
        horizontalStackViewButton.addArrangedSubview(passwordButton)
    }
    
    private func setConstraints() {
        passwordButton.translatesAutoresizingMaskIntoConstraints = false
        userNameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordButton.widthAnchor.constraint(equalToConstant: 200),
            userNameButton.widthAnchor.constraint(equalToConstant: 140),
            
            verticalStackViewTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            verticalStackViewTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            verticalStackViewTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            verticalStackViewTF.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -600),
            
            horizontalStackViewButton.topAnchor.constraint(equalTo: verticalStackViewTF.bottomAnchor, constant: 10),
            horizontalStackViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            horizontalStackViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            horizontalStackViewButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -690),
            
            returnButton.topAnchor.constraint(equalTo: horizontalStackViewButton.bottomAnchor, constant: 210),
            returnButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            returnButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            returnButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250)
        ])
    }
    
    private func createTextField(
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        placeholder: String,
        isSecureTextEntry: Bool,
        returnKeyType: UIReturnKeyType) -> UITextField {
            
            let textField = UITextField()
            textField.textColor = textColor
            textField.backgroundColor = .white
            textField.textAlignment = textAlignment
            textField.placeholder = placeholder
            textField.borderStyle = .roundedRect
            textField.enablesReturnKeyAutomatically = true
            textField.isSecureTextEntry = isSecureTextEntry
            textField.autocorrectionType = .no
            textField.spellCheckingType = .no
            textField.returnKeyType = returnKeyType
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }
    
    private func createButton(withTitle title: String, action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .black
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.titleAlignment = .leading
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
    
    private func modalTransitionInRegisterVC() {
        let registerVC = RegisterViewController()
        registerVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(registerVC, animated: true)
    }
    
    // Mark: -  #selector function
    @objc func goToSettingVC() {
        if self.passwordTF.text == user.password {
//            let settingVC = SettingViewController()
//            delegate = settingVC
//            delegate?.upData(user: userNameTF.text ?? "😢")
//            settingVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//            present(settingVC, animated: true)
            //        navigationController?.pushViewController(settingVC, animated: true)
            let tabBarVC = TabBarController()
            
            let settingVC = SettingViewController()
            let basketVC = BasketTableViewController()
            
            tabBarVC.setViewControllers([settingVC, basketVC], animated: false)
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC , animated: true)
            
            userNameTF.text = ""
            passwordTF.text = ""
        } else {
            self.showAlert(title: "Sorry", message: "You entered the wrong username or password")
        }
    }
}
 
// Mark: -  UIAlertController
extension MainViewController {
    private func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// Mark: - extension UITextFieldDelegate (creat keyword)

extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            goToSettingVC()
        }
        return true
    }
}

// Mark: - creat keyword
extension MainViewController {
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        guard let _ = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else
        { return }
        
        scrollView?.contentOffset = CGPoint.zero
    }
    
    @objc func kbWillHide() {
        scrollView?.contentOffset = CGPoint.zero
    }
    
}
