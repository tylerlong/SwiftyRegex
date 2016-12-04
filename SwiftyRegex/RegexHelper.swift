//
//  RegexHelper.swift
//  SwiftyRegex
//
//  Created by Tyler Long on 17/10/2015.
//  Copyright © 2015 Tylingsoft. All rights reserved.
//

import Foundation


infix operator =~ : ComparisonPrecedence
public func =~(str: String, pattern: String) -> Bool {
    return pattern.toRegex().matches(str).count > 0
}


public extension String {

    fileprivate func toRegex() -> NSRegularExpression {
        return try! NSRegularExpression(pattern: self, options: NSRegularExpression.Options.useUnixLineSeparators)
    }

    public func sub(_ pattern: String, withString: String) -> String {
        let regex = pattern.toRegex()
        let matches = regex.matches(self)
        if matches.count > 0 {
            return regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions.withTransparentBounds, range: matches[0].range, withTemplate: withString)
        }
        return self
    }

    public func gsub(_ pattern: String, withString: String) -> String {
        let regex = pattern.toRegex()
        let result = regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions.withTransparentBounds, range: NSMakeRange(0, self.characters.count), withTemplate: withString)
        return result
    }

    public func scan(_ pattern: String) -> [String] {
        let regex = pattern.toRegex()
        let matches = regex.matches(self)
        let str = self as NSString
        let result = matches.map { str.substring(with: $0.range) }
        return result
    }

    public func split(_ pattern: String) -> [String] {
        let separator = "~@$^*)+_(&%#!"
        let temp = self.gsub(pattern, withString: separator)
        return temp.components(separatedBy: separator)
    }

}


private extension NSRegularExpression {

    func matches(_ input: String) -> [NSTextCheckingResult] {
        return self.matches(in: input, options: NSRegularExpression.MatchingOptions.withTransparentBounds, range: NSMakeRange(0, input.characters.count))
    }

}
