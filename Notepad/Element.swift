//
//  Element.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import Foundation


/// A String type enum to keep track of the different elements we're tracking with regex.
enum Element: String {
    case unknown = ""
    
    case h1 = "^(\\#[^\\#](.*))$"
    case h2 = "^(\\#{2}(.*))$"
    case h3 = "^(\\#{3}(.*))$"
    
    case body = ".*"
    
    case bold = "\\**(?:^|[^*])(\\*\\*(\\w+(\\s\\w+)*)\\*\\*)"
    case italic = "\\**(?:^|[^*])(\\*(\\w+(\\s\\w+)*)\\*)"
    case boldItalic = "(\\*\\*\\*\\w+(\\s\\w+)*\\*\\*\\*)"
    case code = "(`\\w+(\\s\\w+)*`)"
    
    /// Converts an enum value (type String) to a NSRegularExpression.
    ///
    /// - returns: The NSRegularExpression.
    func toRegex() -> NSRegularExpression {
        var pattern: NSRegularExpression = NSRegularExpression()
        
        do {
            try pattern = NSRegularExpression(pattern: self.rawValue, options: .anchorsMatchLines)
        } catch {
            print(error)
        }
        
        return pattern
    }
    
    /// Returns an Element enum based upon a String.
    ///
    /// - parameter string: The String representation of the enum.
    ///
    /// - returns: The Element enum match.
    func from(string: String) -> Element {
        switch string {
        case "h1": return .h1
        case "h2": return .h2
        case "h3": return .h3
        case "body": return .body
        case "bold": return .bold
        case "italic": return .italic
        case "boldItalic": return .boldItalic
        case "code": return .code
        default: return .unknown
        }
    }
}
