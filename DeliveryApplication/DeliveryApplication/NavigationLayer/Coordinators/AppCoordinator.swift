//
//  AppCoordinator.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 07.02.2025.
//

import UIKit

class AppCoordinator: Coordinator{
    override func start() {
        //showOnboardingFlow()
        showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController, finishDelegate: self)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "pencil"), tag: 0)
        addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController, finishDelegate: self)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "pencil"), tag: 1)
        addChildCoordinator(orderCoordinator)
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController, finishDelegate: self)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "pencil"), tag: 2)
        addChildCoordinator(listCoordinator)
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController, finishDelegate: self)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "pencil"), tag: 3)
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: false)
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(_ childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
