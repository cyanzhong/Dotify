//
//  Dotify.swift
//  Dotify
//
//  Created by cyan on 16/7/9.
//  Copyright © 2016年 cyan. All rights reserved.
//

import Foundation

typealias replaceHandler = (result: TextCheckingResult?, text: NSMutableString) -> NSMutableString

func replace(code: String, pattern: String, handler: replaceHandler) -> String {
    
    var result = NSMutableString(string: code)
    
    do {
        let regex = try RegularExpression(pattern: pattern, options: [])
        while true {
            let range = NSMakeRange(0, result.length)
            let text = result as String
            if regex.numberOfMatches(in: text, options: [], range: range) == 0 {
                break
            }
            regex.enumerateMatches(in: text, options: [], range: range, using: { matchResult, flags, stop in
                let modified = handler(result: matchResult, text: result)
                if !result.isEqual(to: modified) {
                    stop.initialize(with: true)
                }
                result = modified
            })
        }
    } catch {
        print("# Dotify # Failed.")
    }
    
    return result as String
}

extension String {
    
    func dotify(pattern: String, handler: replaceHandler) -> String {
        return replace(code: self, pattern: pattern, handler: handler)
    }
    
    func lowecaseFirst() -> String {
        return String(self.characters.prefix(1)).lowercased() + String(self.characters.dropFirst())
    }
}

func dotify(code: String) -> String {
    return code.dotify(pattern: "\\[ *([a-zA-Z0-9_$\\.]+) +([a-zA-Z0-9_$\\.]+) *\\]", handler: { result, text -> NSMutableString in
        // [AnObject method1] -> AnObject.method1
        if let range = result?.range, r1 = result?.range(at: 1), r2 = result?.range(at: 2) {
            let object = text.substring(with: r1)
            let method = text.substring(with: r2)
            text.replaceCharacters(in: range, with: "\(object).\(method)")
        }
        return text
    }).dotify(pattern: "\\[ *([a-zA-Z0-9_$]+) +set([a-zA-Z0-9_$]+) *: *(.+) *\\]", handler: { result, text -> NSMutableString in
        // [self setUserInteractionEnabled:NO] -> self.userInteractionEnabled = NO
        if let range = result?.range, r1 = result?.range(at: 1), r2 = result?.range(at: 2), r3 = result?.range(at: 3) {
            let object = text.substring(with: r1)
            let method = (text.substring(with: r2) as String).lowecaseFirst()
            let value = text.substring(with: r3)
            text.replaceCharacters(in: range, with: "\(object).\(method) = \(value)")
        }
        return text
    })
}
