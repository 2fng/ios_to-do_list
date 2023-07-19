//
//  HomeAssembler.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 19/07/2023.
//

import Foundation
import UIKit

protocol HomeAssembler {
    func resolve(navigationController: UINavigationController) -> HomeViewController
    func resolve(navigationController: UINavigationController) -> HomeViewModel
    func resolve(navigationController: UINavigationController) -> HomeNavigatorType
    func resolve() -> HomeUseCaseType
}

extension HomeAssembler {
    func resolve(navigationController: UINavigationController) -> HomeViewController {
        let viewController = HomeViewController()
        let viewModel: HomeViewModel = resolve(navigationController: navigationController)
        viewController.bindViewModel(to: viewModel)
        return viewController
    }

    func resolve(navigationController: UINavigationController) -> HomeViewModel {
        return HomeViewModel(navigator: resolve(navigationController: navigationController), useCase: resolve())
    }
}

extension HomeAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> HomeNavigatorType {
        return HomeNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> HomeUseCaseType {
        return HomeUseCase()
    }
}
