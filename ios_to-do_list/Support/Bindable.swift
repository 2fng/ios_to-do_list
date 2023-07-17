//
//  Bindable.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation
import UIKit

public protocol Bindable: AnyObject {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    public func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
