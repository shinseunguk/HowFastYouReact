//
//  String+Extension.swift
//  HowFastYouReact
//
//  Created by plsystems on 2023/03/14.
//

import Foundation

extension String {
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
}
