//
//  MainViewController.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 18.03.2023.
//

import UIKit

// Mark: - Class MainViewController

class MainViewController: UIViewController {
    
    // Mark: - Public property
    var scrollView: UIScrollView?
    
    
    // Mark: - Public property
    private let user = User.getUser()
    
    private let userNameTF = CustomTextField(
        placeholder: "Имя пользователя",
        isSecureTextEntry: false,
        returnKeyType: .next
    )
    
    private let passwordTF = CustomTextField(
        placeholder: "Пароль",
        isSecureTextEntry: false,
        returnKeyType: .done
    )


    private let ForgotPasswordButton = CustomButton(
        withTitle: "Забыли пароль?",
        textAlignment: .left,
        font: 12,
        addTarget: self,
        action:  #selector(modalTransitionInRegisterVC),
        forTarget: .touchUpInside)
    
    
    private let registerButton = CustomButton(
        withTitle: "Зарегистрироваться",
        textAlignment: .right,
        font: 12,
        addTarget: self,
        action: #selector(modalTransitionInRegisterVC),
        forTarget: .touchUpInside
    )
    
    private let returnButton = CustomButton(
        withTitle: "Продолжить",
        textAlignment: .center,
        font: 25,
        addTarget: self,
        action: #selector(goToSettingVC),
        forTarget: .touchUpInside
    )
    
    
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
        verticalStackView.spacing = 60
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
        horizontalStackViewButton.addArrangedSubview(ForgotPasswordButton)
        horizontalStackViewButton.addArrangedSubview(registerButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            registerButton.widthAnchor.constraint(equalToConstant: 190),
            ForgotPasswordButton.widthAnchor.constraint(equalToConstant: 100),
            
            verticalStackViewTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            verticalStackViewTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            verticalStackViewTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            verticalStackViewTF.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -670),
            
            horizontalStackViewButton.topAnchor.constraint(equalTo: verticalStackViewTF.bottomAnchor, constant: 0),
            horizontalStackViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            horizontalStackViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            horizontalStackViewButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -760),
            
            
            returnButton.topAnchor.constraint(lessThanOrEqualTo: horizontalStackViewButton.bottomAnchor, constant: 110),
            returnButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            returnButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            returnButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    @objc func modalTransitionInRegisterVC() {
        let registerVC = RegisterViewController()
        registerVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(registerVC, animated: true)
    }
    
    // Mark: -  #selector function
    @objc func goToSettingVC() {
        if self.passwordTF.text == user.password {
        
//            settingVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//            present(settingVC, animated: true)
            //        navigationController?.pushViewController(settingVC, animated: true)
          
            let tabBarVC = TabBarController()
            tabBarVC.modalPresentationStyle = .fullScreen
            
            tabBarVC.userName = userNameTF.text ?? "😢"

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
