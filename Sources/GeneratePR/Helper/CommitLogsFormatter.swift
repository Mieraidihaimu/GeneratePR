//
//  CommitLogsFormatter.swift
//  
//
//  Created by Mier on 06/11/2021.
//

import Foundation

struct CommitLogsFormatter {
    private static let linePrefixCharacter = "- "
    private static let lineBreak: Character = "\n"

    static func format(commitLogsOutput output: String) -> String {
        output
            .split(separator: lineBreak)
            .map { formatLineIfNeeded(String($0)) }
            .joined(separator: String(lineBreak))
    }


    private static func formatLineIfNeeded(_ line: String) -> String {
        guard line.prefix(2) != linePrefixCharacter else { return line }
        if #available(macOS 10.11, *) {
            return linePrefixCharacter + line.localizedCapitalized
        } else {
            return linePrefixCharacter + line
        }
    }
}
