//
//  ViewModel.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import RxSwift

public protocol ViewModel {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output
}
