//
//  AppDelegate.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 09/07/2023.
//

import UIKit
import RxCocoa
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    var disposeBag = DisposeBag()

    func applicationDidFinishLaunching(_ application: UIApplication) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        bindViewModel(window: window)
    }

    private func bindViewModel(window: UIWindow) {
        let viewModel: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(load: Driver.just(()))
        _ = viewModel.transform(input, disposeBag: disposeBag)
    }
}

