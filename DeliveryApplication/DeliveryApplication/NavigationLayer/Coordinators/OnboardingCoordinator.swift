//
//  OnboardingCoordinator.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 07.02.2025.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
