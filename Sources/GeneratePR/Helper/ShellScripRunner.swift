//
//  ShellScripRunner.swift
//  
//
//  Created by Mier on 13/09/2021.
//

import Foundation

final class ShellScripRunner {
    @discardableResult
    static func runShell(command: String) -> String {
        let process = Process()
        process.launchPath = "/bin/sh/"
        process.arguments = ["-c", command]
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.launch()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        Log.debug("Run ' \(command) ' Output:\n\(output)")
        return output
    }
}
