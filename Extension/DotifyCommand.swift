//
//  DotifyCommand.swift
//  Extension
//
//  Created by cyan on 16/7/9.
//  Copyright © 2016年 cyan. All rights reserved.
//

import Foundation
import XcodeKit

class DotifyCommand: xTextCommand {
    override func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: (NSError?) -> Void ) -> Void {
        xTextModifier.any(invocation: invocation, options: [.selected, .cursor]) { text -> String in dotify(code: text) }
        completionHandler(nil)
    }
}
