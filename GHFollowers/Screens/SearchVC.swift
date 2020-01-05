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
    let usernameTextField = GFTextField(placeholderText: "Enter a username")
    let searchButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool{ return !usernameTextField.text!.isEmpty}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureSearchButton()
        configureTextField()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    @objc func pushFollowerListVC(){
        guard isUsernameEntered else{
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username, we need to know who to look for", buttonTitle: "Ok")
            return
        }
        let followerListVC = FollowersListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
       
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
        usernameTextField.delegate = self
        view.addSubview(usernameTextField)
        view.addConstraints([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48.0),
            usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0),
            usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0),
            usernameTextField.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    
    func configureSearchButton(){
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        view.addConstraints([
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0),
            searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0),
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    func createDismissKeyboardTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        pushFollowerListVC()
        return true
    }
    
}
