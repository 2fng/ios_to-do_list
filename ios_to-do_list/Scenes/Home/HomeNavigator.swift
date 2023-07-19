//
//  HomeNavigator.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 19/07/2023.
//

import Foundation
import UIKit

protocol HomeNavigatorType {
    
}

struct HomeNavigator: HomeNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
