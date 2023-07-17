//
//  AppSettings.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation

enum AppSettings {
    @Storage(key: "didInit", defaultValue: false)
    static var didInit: Bool
}
