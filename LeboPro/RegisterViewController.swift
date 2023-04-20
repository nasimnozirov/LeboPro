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
         createTextField(placeholder: "Password", isSecureTextEntry: true, returnKeyType: .done)
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
    
    // Mark: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubview()
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
    
    private func addSubview() {
        view.addSubview(verticalStackViewTF)
    }
    
    private func addElementInStack() {
        verticalStackViewTF.addArrangedSubview(nameTF)
        verticalStackViewTF.addArrangedSubview(surnameTF)
        verticalStackViewTF.addArrangedSubview(emailTF)
        verticalStackViewTF.addArrangedSubview(passwordTF)
    }
    
    private func createTextField(
        placeholder: String,
        isSecureTextEntry: Bool,
        returnKeyType: UIReturnKeyType) -> UITextField {
            
        let textField = UITextField()
        textField.textColor = .black
        //textField.backgroundColor = .white
        textField.textAlignment = .left
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

    private func setConstraints() {
        NSLayoutConstraint.activate([
        verticalStackViewTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        verticalStackViewTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
        verticalStackViewTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        verticalStackViewTF.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , constant: -500)
        ])
    }
}

// Mark: - extension UITextFieldDelegate (creat keyword)
extension RegisterViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTF {
            passwordTF.becomeFirstResponder()
        } else {
            
        }
        return true
    }
}

extension RegisterViewController {
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(WillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(WillHide),
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
    
    @objc func WillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        guard let _ = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else
        { return }
        
        scrollView?.contentOffset = CGPoint.zero
    }
    
    @objc func WillHide() {
        scrollView?.contentOffset = CGPoint.zero
    }
    
}
