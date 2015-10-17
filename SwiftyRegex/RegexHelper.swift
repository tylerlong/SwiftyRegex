//
//  RegexHelper.swift
//  SwiftyRegex
//
//  Created by Tyler Long on 17/10/2015.
//  Copyright © 2015 Tylingsoft. All rights reserved.
//

import Foundation


infix operator =~ {
associativity none
precedence 130
}
func =~(str: String, pattern: String) -> Bool {
    return pattern.toRegex().matches(str).count > 0
}


extension String {

    func toRegex() -> NSRegularExpression {
        return try! NSRegularExpression(pattern: self, options: NSRegularExpressionOptions.UseUnixLineSeparators)
    }

    func sub(pattern: String, withString: String) -> String {
        let regex = pattern.toRegex()
        let matches = regex.matches(self)
        if matches.count > 0 {
            return regex.stringByReplacingMatchesInString(self, options: NSMatchingOptions.WithTransparentBounds, range: matches[0].range, withTemplate: withString)
        }
        return self
    }

    func gsub(pattern: String, withString: String) -> String {
        let regex = pattern.toRegex()
        let result = regex.stringByReplacingMatchesInString(self, options: NSMatchingOptions.WithTransparentBounds, range: NSMakeRange(0, self.characters.count), withTemplate: withString)
        return result
    }

    func scan(pattern: String) -> [String] {
        let regex = pattern.toRegex()
        let matches = regex.matches(self)
        let str = self as NSString
        let result = matches.map { str.substringWithRange($0.range) }
        return result
    }

}


extension NSRegularExpression {

    func matches(input: String) -> [NSTextCheckingResult] {
        return self.matchesInString(input, options: NSMatchingOptions.WithTransparentBounds, range: NSMakeRange(0, input.characters.count))
    }

}
