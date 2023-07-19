//
//  Assembler.swift
//  ios_to-do_list
//
//  Created by Hua Son Tung on 12/07/2023.
//

import Foundation

protocol Assembler: AnyObject, AppAssembler, MainAssembler, HomeAssembler {

}

final class DefaultAssembler: Assembler {

}
