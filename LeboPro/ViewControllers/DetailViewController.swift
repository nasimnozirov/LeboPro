//
//  DetailViewController.swift
//  LeboPro
//
//  Created by Nasim Nozirov on 11.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var modalNameProduct: Product!
    
  
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
     
    private let productNameLabel = CustomLabel(
        backgroundColor: .white,
        textColor: .black,
        title: "",
        font: UIFont.systemFont(ofSize: 30)
    )
    
    private let subtitle = CustomLabel(
        backgroundColor: .white,
        textColor: .black,
        title: "",
        font: UIFont.systemFont(ofSize: 20)
     )
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        setupScrollView()
        fixConstraint()
        
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(subtitle)
        
    }
   
    private func fixConstraint() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            productNameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            productNameLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            productNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
           
            subtitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subtitle.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            subtitle.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 20),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50)
        ])
    }

}
