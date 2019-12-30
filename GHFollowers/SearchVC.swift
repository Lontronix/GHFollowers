//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Lonnie Gerol on 12/30/19.
//  Copyright © 2019 Lonnie Gerol. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    let logoImageView = UIImageView(image: UIImage(named: "gh-logo"))
    let searchTextField = GFTextField(placeholderText: "Enter a username")
    let searchButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureSearchButton()
        configureTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        view.addConstraints([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80.0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField(){
        view.addSubview(searchTextField)
        view.addConstraints([
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48.0),
            searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0),
            searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    
    func configureSearchButton(){
        view.addSubview(searchButton)
        view.addConstraints([
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0),
            searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0),
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    


}
