//
//  AppGateway.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation

protocol AppGatewayType {
    func checkFirstRun() -> Bool
    func setFirstRun()
}

struct AppGateway: AppGatewayType {
    func checkFirstRun() -> Bool {
        return !AppSettings.didInit
    }

    func setFirstRun() {
        AppSettings.didInit = true
    }
}
