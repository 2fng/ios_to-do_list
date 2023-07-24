//
//  AppViewModel.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

extension AppViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }

    struct Output {

    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        input.load
            .drive(onNext: self.navigator.toMain)
            .disposed(by: disposeBag)

        return Output()
    }
}
