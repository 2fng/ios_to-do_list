//
//  MainAssembler.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import UIKit

protocol MainAssembler {
    func resolve(navigationController: UINavigationController) -> MainViewController
    func resolve(navigationController: UINavigationController) -> MainViewModel
    func resolve(navigationController: UINavigationController) -> MainNavigatorType
    func resolve() -> MainUseCaseType
}

extension MainAssembler {
    func resolve(navigationController: UINavigationController) -> MainViewController {
        let viewController = MainViewController()
        let viewModel: MainViewModel = resolve(navigationController: navigationController)
        viewController.bindViewModel(to: viewModel)
        return viewController
    }

    func resolve(navigationController: UINavigationController) -> MainViewModel {
        return MainViewModel(navigator: resolve(navigationController: navigationController),
                             useCase: resolve()
        )
    }
}

extension MainAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> MainNavigatorType {
        return MainNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> MainUseCaseType {
        return MainUseCase()
    }
}
