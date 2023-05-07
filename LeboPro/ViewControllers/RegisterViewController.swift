//
//  RegisterViewController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 16.04.2023.
//

import UIKit

// Mark: - Class RegisterViewController
class RegisterViewController: UIViewController {
    
    // Mark: - Public property
    var scrollView: UIScrollView?
    
    // Mark: - Public property
    private lazy var nameTF: UITextField = {
         createTextField(placeholder: "Name", isSecureTextEntry: false, returnKeyType: .next)
     }()

    private lazy var surnameTF: UITextField = {
         createTextField(placeholder: "Surname", isSecureTextEntry: false, returnKeyType: .next)
     }()
     
    private lazy var emailTF: UITextField = {
         createTextField(placeholder: "Email", isSecureTextEntry: false, returnKeyType: .next)
     }()
    
    private lazy var passwordTF: UITextField = {
         createTextField(placeholder: "Password", isSecureTextEntry: false, returnKeyType: .done)
     }()
    
    private lazy var saveButton: UIButton = {
        createButton(withTitle: "Сахранить", action: UIAction { _ in
            self.touch()
        })
        
    }()
    
    private lazy var cancelButton: UIButton = {
        createButton(withTitle: "Отмена", action: UIAction { _ in
            self.touch()
        })
        
    }()

    private lazy var verticalStackViewTF: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 30
        verticalStackView.backgroundColor = .black
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    private lazy var horizontalStackViewButton: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 120
        horizontalStackView.backgroundColor = .black
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStackView
    }()
    
    // Mark: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addElementInView()
        setConstraints()
        addElementInStack()
        delegateTF()
       
    }
    
    // Mark: - Private function
    private func delegateTF() {
        nameTF.delegate = self
        surnameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    private func addElementInView() {
        view.addSubview(verticalStackViewTF)
        view.addSubview(horizontalStackViewButton)
    }
    
    private func addElementInStack() {
        verticalStackViewTF.addArrangedSubview(nameTF)
        verticalStackViewTF.addArrangedSubview(surnameTF)
        verticalStackViewTF.addArrangedSubview(emailTF)
        verticalStackViewTF.addArrangedSubview(passwordTF)
        
        horizontalStackViewButton.addArrangedSubview(saveButton)
        horizontalStackViewButton.addArrangedSubview(cancelButton)
    }
    
    private func createButton(withTitle title: String, action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .black
        buttonConfiguration.baseForegroundColor = .white
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
    
    private func createTextField(
        placeholder: String,
        isSecureTextEntry: Bool,
        returnKeyType: UIReturnKeyType) -> UITextField {
            
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .white
//        textField.textAlignment = .left
        textField.placeholder = placeholder
        textField.borderStyle = .none
        textField.enablesReturnKeyAutomatically = true
        textField.isSecureTextEntry = isSecureTextEntry
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.returnKeyType = returnKeyType
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            
        horizontalStackViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        horizontalStackViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        horizontalStackViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            
        verticalStackViewTF.topAnchor.constraint(lessThanOrEqualTo: horizontalStackViewButton.bottomAnchor, constant: 50),
        verticalStackViewTF.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        verticalStackViewTF.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -500),
        verticalStackViewTF.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100),
       
    ])
    }
   @objc func touch() {
     dismiss(animated: true)
    }
}

// Mark: - extension UITextFieldDelegate (creat keyword)
extension RegisterViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTF:
            surnameTF.becomeFirstResponder()
        case surnameTF:
            emailTF.becomeFirstResponder()
        case emailTF:
            passwordTF.becomeFirstResponder()
        default:
           touch()
        }
     return true
  }
}

//extension RegisterViewController {
//    private func registerForKeyboardNotifications() {
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(willShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil)
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(willHide),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil)
//    }
//
//    private func removeKeyboardNotifications() {
//        NotificationCenter.default.removeObserver(
//            self,
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil)
//
//        NotificationCenter.default.removeObserver(
//            self,
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil)
//    }
//
//    @objc func willShow(_ notification: Notification) {
//        let userInfo = notification.userInfo
//        guard let _ = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else
//        { return }
//
//        scrollView?.contentOffset = CGPoint.zero
//    }
//
//    @objc func willHide() {
//        scrollView?.contentOffset = CGPoint.zero
//    }
//
//}
