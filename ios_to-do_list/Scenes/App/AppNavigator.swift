//
//  AppNavigator.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import UIKit

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow

    func toMain() {
        let navigator = UINavigationController()
        let viewController: MainViewController = assembler.resolve(navigationController: navigator)
        navigator.viewControllers.append(viewController)

        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
}
