//
//  SettingViewController.swift
//  LoginAppInCode
//
//  Created by Nasim Nozirov on 27.03.2023.
//

import UIKit


class SettingViewController: UIViewController {
    
    var delegate: TransmissionOfInformationDelegate?
    
    var mainVC: MainViewController?
    private var userName = ""
    private lazy var emojiLabel: UILabel = {
        aditLabel(label: "🌚👀💋", fond: UIFont.systemFont(ofSize: 80))
    }()
    
    lazy var userLabel: UILabel = {
        aditLabel(label: "Hi \(String(describing: delegate?.updata(user: "hhh")))", fond: UIFont.systemFont(ofSize: 80))
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
        addElementInStack()
        fixToConstraint()
    }
    
    private func addElementInStack() {
        verticalStackView.addArrangedSubview(userLabel)
        verticalStackView.addArrangedSubview(emojiLabel)
    }
    
    
    private func aditLabel(label text: String, fond: UIFont) -> UILabel {
        let label = UILabel()
        label.text =  text
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
            verticalStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -500)
        ])
    }
    

}


