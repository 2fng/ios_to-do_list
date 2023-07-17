//
//  MainViewModel.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import RxSwift
import RxCocoa

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

extension MainViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }

    struct Output {

    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        input.load
            .drive()
            .disposed(by: disposeBag)

        return output
    }
}
