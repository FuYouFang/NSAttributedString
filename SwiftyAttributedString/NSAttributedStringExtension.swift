//
//  NSAttributedStringExtension.swift
//  NSAttributedString
//
//  Created by fuyoufang on 2019/12/29.
//  Copyright © 2019 fuyoufang. All rights reserved.
//

import UIKit

enum HTMLStringError: Error {
    case invalidData
    case underlying(Error)
}


// MARK: HTML
// 参考项目 https://github.com/devxoul/Drrrible
extension NSAttributedString {
    
    
    /// 由 HTML 创建 NSAttributedString
    /// - Parameters:
    ///   - htmlString: 内容
    ///   - fontFamily: 字体
    ///   - fontSize: 字号
    convenience init(
        htmlString: String,
        fontFamily: String = "-apple-system",
        fontSize: CGFloat = UIFont.systemFontSize
    ) throws {
        let styleTagString = NSAttributedString.styleForFont(family: fontFamily, size: fontSize)
        let htmlString = styleTagString + htmlString
        guard let data = htmlString.data(using: .utf8) else { throw HTMLStringError.invalidData }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue as NSNumber,
        ]
        do {
            try self.init(data: data, options: options, documentAttributes: nil)
        } catch let error {
            throw HTMLStringError.underlying(error)
        }
    }
    
    private class func styleForFont(family: String, size: CGFloat) -> String {
        return "<style>body{font-family: '\(family)';font-size: \(size)px;}</style>"
    }
}
