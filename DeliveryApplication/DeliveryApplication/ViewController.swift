//
//  ViewController.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 05.02.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Hello World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        label.font = .Roboto.bold.size(40)
        label.textColor = .white
        
        view.backgroundColor = .red
    }


}

