//
//  LogHelper.swift
//  HowFastYouReact
//
//  Created by plsystems on 2023/03/13.
//

import Foundation

internal func traceLog(_ description: String,
           fileName: String = #file,
           lineNumber: Int = #line,
           functionName: String = #function) {

    // swiftlint:disable:next line_length
    let traceString = "\(fileName.components(separatedBy: "/").last!) -> \(functionName) -> \(description) (line: \(lineNumber))"
    print(traceString)
}
