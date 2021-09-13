//
//  Log.swift
//  
//
//  Created by Mier on 13/09/2021.
//

import Foundation

enum Log {
    static var isEnabled: Bool = false

    static func debug(_ message: Any) {
        guard isEnabled else { return }
        print(message)
    }

    static func message(_ message: Any) {
        print(message)
    }
}
