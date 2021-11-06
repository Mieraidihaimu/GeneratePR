//
//  File.swift
//  
//
//  Created by Mier on 06/11/2021.
//

import Foundation

struct CommitLogsFormatter {
    private static let linePrefixCharacter = "- "
    private static let lineBreak = "\n"

    static func format(commitLogsOutput output: String) -> String {
        output
            .split(separator: lineBreak)
            .map { formatLineIfNeeded($0) }
            .joined(separator: lineBreak)
    }


    private static func formatLineIfNeeded(_ line: String) -> String {
        guard line.prefix(2) != linePrefixCharacter else { return line }
        return linePrefixCharacter + line.localizedCapitalized
    }
}
