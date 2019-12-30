//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Lonnie Gerol on 12/30/19.
//  Copyright © 2019 Lonnie Gerol. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        let button = GFButton(backgroundColor: .systemRed, title: "Hello World")
        view.addSubview(button)
        view.addConstraints([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0)
        ])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
