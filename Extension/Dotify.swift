//
//  Dotify.swift
//  Dotify
//
//  Created by cyan on 16/7/9.
//  Copyright © 2016年 cyan. All rights reserved.
//

import Foundation

func dotify(code: String) -> String {
    
    let pattern = "\\[ *([a-zA-Z0-9_$\\.]+) +([a-zA-Z0-9_$\\.]+) *\\]"
    let result = NSMutableString(string: code)
    
    do {
        let regex = try RegularExpression(pattern: pattern, options: [])
        while true {
            let range = NSMakeRange(0, result.length)
            let text = result as String
            if regex.numberOfMatches(in: text, options: [], range: range) == 0 {
                break
            }
            regex.enumerateMatches(in: text, options: [], range: range, using: { matchResult, flags, stop in
                if let range = matchResult?.range, r1 = matchResult?.range(at: 1), r2 = matchResult?.range(at: 2) {
                    let object = result.substring(with: r1)
                    let method = result.substring(with: r2)
                    result.replaceCharacters(in: range, with: "\(object).\(method)")
                }
            })
        }
    } catch {
        print("# Dotify # Failed.")
    }
    
    return result as String
}
