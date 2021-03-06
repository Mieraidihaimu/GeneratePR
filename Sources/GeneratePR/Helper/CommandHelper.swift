//
//  CommandHelper.swift
//  
//
//  Created by Mier on 13/09/2021.
//

import Foundation

struct CommandHelper {
    static var fixPRTemplate: String {
        """
        # Related links

        close https://github.com/%1$@

        # Why?

        As pet ticket above, we need to fix the defect in this release.

        # How?

        Changes included:
        %2$@

        %3$@

        # Screenshots

        Before|After
        -|-
        <img src="" width="187.5" />|<img src="" width="187.5" />


        """
    }

    static var featurePRTemplate: String {
        """
        # Related links

        https://github.com/%1$@

        # Why?

        As pet ticket above, Product wants to improve ...

        # How?

        Changes included:
        %2$@

        %3$@

        # Screenshots

        Normal|Dark Mode|Accessibility |RTL
        ---|---|---|---
        <img src="" width="187.5" />|<img src="" width="187.5" />|<img src="" width="187.5" />|<img src="" width="187.5" />


        """
    }

    static func generateDescription(
        issue: String,
        prType: PRType,
        commitLogs: String,
        extra: String
    ) -> String {
        String(
            format: prType == .feature ? featurePRTemplate : fixPRTemplate,
            "\(issue)",
            "\(commitLogs)",
            "\(extra)"
        )
    }
}
