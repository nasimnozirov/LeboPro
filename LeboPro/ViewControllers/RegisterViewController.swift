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
    let mainVC = MainViewController()
    
    // Mark: - Public property
    private let nameTF = CustomTextField(
        placeholder: "Имя",
        isSecureTextEntry: false,
        returnKeyType: .next
    )

    private let surnameTF = CustomTextField(
        placeholder: "Фамилия",
        isSecureTextEntry: false,
        returnKeyType: .next
    )
     
    private let emailTF = CustomTextField(
        placeholder: "Почта",
        isSecureTextEntry: false,
        returnKeyType: .next
    )
    
    private lazy var passwordTF = CustomTextField(
        placeholder: "Пароль",
        isSecureTextEntry: false,
        returnKeyType: .done
    )
    
    private let saveButton = CustomButton(
        withTitle: "Сахранить",
        textAlignment: .center,
        font: 16
    )
    
    private let cancelButton = CustomButton(
        withTitle: "Отменить",
        textAlignment: .center,
        font: 16
    )
    

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
        horizontalStackView.backgroundColor = .white
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
    
    private func addTargetInButton() {
        saveButton.addTarget(self, action: #selector(mainVC.touch), for: .touchUpInside)
        print("ok1")
        cancelButton.addTarget(self, action: #selector(mainVC.touch), for: .touchUpInside)
        print("ok2")
    }
    
    private func addElementInStack() {
        verticalStackViewTF.addArrangedSubview(nameTF)
        verticalStackViewTF.addArrangedSubview(surnameTF)
        verticalStackViewTF.addArrangedSubview(emailTF)
        verticalStackViewTF.addArrangedSubview(passwordTF)
        
        horizontalStackViewButton.addArrangedSubview(saveButton)
        horizontalStackViewButton.addArrangedSubview(cancelButton)
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
            mainVC.touch()
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
