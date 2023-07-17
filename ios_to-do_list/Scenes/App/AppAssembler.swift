//
//  AppAssembler.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import UIKit

protocol AppAssembler {
    func resolve(window: UIWindow) -> AppViewModel
    func resolve(window: UIWindow) -> AppNavigatorType
    func resolve() -> AppUseCaseType
}

extension AppAssembler {
    func resolve(window: UIWindow) -> AppViewModel {
        return AppViewModel(navigator: resolve(window: window), useCase: resolve())
    }
}

extension AppAssembler where Self: DefaultAssembler {
    func resolve(window: UIWindow) -> AppNavigatorType {
        return AppNavigator(assembler: self, window: window)
    }

    func resolve() -> AppUseCaseType {
        return AppUseCase(appGateway: AppGateway())
    }
}
