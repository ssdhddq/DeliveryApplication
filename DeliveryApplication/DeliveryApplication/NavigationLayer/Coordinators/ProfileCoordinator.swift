//
//  ProfileCoordinator.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 07.02.2025.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .black
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
