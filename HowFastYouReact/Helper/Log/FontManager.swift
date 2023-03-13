//
//  FontManager.swift
//  Summar
//
//  Created by plsystems on 2023/01/20.
//
import Foundation
import UIKit

enum FontSize: CGFloat {
    case small11 = 11
    case small12 = 12
    case medium14 = 14
    case medium15 = 15
    case large16 = 16
    case extraLarge18 = 18
}

enum Font: Int {
    case Black
    case Bold
    case ExtraBold
    case ExtraLight
    case Light
    case Medium
    case Regular
    case SemiBold
    case Thin
    
    /// 아이폰 작은 글씨(size: 11)
    var small11Font: UIFont {
        switch self {
        case .Black:
            return UIFont(name: "Pretendard-Black", size: FontSize.small11.rawValue)!
        case .Bold:
            return UIFont(name: "Pretendard-Bold", size: FontSize.small11.rawValue)!
        case .ExtraBold:
            return UIFont(name: "Pretendard-ExtraBold", size: FontSize.small11.rawValue)!
        case .ExtraLight:
            return UIFont(name: "Pretendard-ExtraLight", size: FontSize.small11.rawValue)!
        case .Light:
            return UIFont(name: "Pretendard-Light", size: FontSize.small11.rawValue)!
        case .Medium:
            return UIFont(name: "Pretendard-Medium", size: FontSize.small11.rawValue)!
        case .Regular:
            return UIFont(name: "Pretendard-Regular", size: FontSize.small11.rawValue)!
        case .SemiBold:
            return UIFont(name: "Pretendard-SemiBold", size: FontSize.small11.rawValue)!
        case .Thin:
            return UIFont(name: "Pretendard-Thin", size: FontSize.small11.rawValue)!
        }
    }

    /// 아이폰 작은 글씨(size: 12)
    var smallFont: UIFont {
        switch self {
        case .Black:
            return UIFont(name: "Pretendard-Black", size: FontSize.small12.rawValue)!
        case .Bold:
            return UIFont(name: "Pretendard-Bold", size: FontSize.small12.rawValue)!
        case .ExtraBold:
            return UIFont(name: "Pretendard-ExtraBold", size: FontSize.small12.rawValue)!
        case .ExtraLight:
            return UIFont(name: "Pretendard-ExtraLight", size: FontSize.small12.rawValue)!
        case .Light:
            return UIFont(name: "Pretendard-Light", size: FontSize.small12.rawValue)!
        case .Medium:
            return UIFont(name: "Pretendard-Medium", size: FontSize.small12.rawValue)!
        case .Regular:
            return UIFont(name: "Pretendard-Regular", size: FontSize.small12.rawValue)!
        case .SemiBold:
            return UIFont(name: "Pretendard-SemiBold", size: FontSize.small12.rawValue)!
        case .Thin:
            return UIFont(name: "Pretendard-Thin", size: FontSize.small12.rawValue)!
        }
    }
    
    /// 아이폰 medium 글씨(size: 14)
    var mediumFont: UIFont {
        switch self {
        case .Black:
            return UIFont(name: "Pretendard-Black", size: FontSize.medium14.rawValue)!
        case .Bold:
            return UIFont(name: "Pretendard-Bold", size: FontSize.medium14.rawValue)!
        case .ExtraBold:
            return UIFont(name: "Pretendard-ExtraBold", size: FontSize.medium14.rawValue)!
        case .ExtraLight:
            return UIFont(name: "Pretendard-ExtraLight", size: FontSize.medium14.rawValue)!
        case .Light:
            return UIFont(name: "Pretendard-Light", size: FontSize.medium14.rawValue)!
        case .Medium:
            return UIFont(name: "Pretendard-Medium", size: FontSize.medium14.rawValue)!
        case .Regular:
            return UIFont(name: "Pretendard-Regular", size: FontSize.medium14.rawValue)!
        case .SemiBold:
            return UIFont(name: "Pretendard-SemiBold", size: FontSize.medium14.rawValue)!
        case .Thin:
            return UIFont(name: "Pretendard-Thin", size: FontSize.medium14.rawValue)!
        }
    }
    
    /// 아이폰 medium 글씨(size: 15)
    var medium15Font: UIFont {
        switch self {
        case .Black:
            return UIFont(name: "Pretendard-Black", size: FontSize.medium15.rawValue)!
        case .Bold:
            return UIFont(name: "Pretendard-Bold", size: FontSize.medium15.rawValue)!
        case .ExtraBold:
            return UIFont(name: "Pretendard-ExtraBold", size: FontSize.medium15.rawValue)!
        case .ExtraLight:
            return UIFont(name: "Pretendard-ExtraLight", size: FontSize.medium15.rawValue)!
        case .Light:
            return UIFont(name: "Pretendard-Light", size: FontSize.medium15.rawValue)!
        case .Medium:
            return UIFont(name: "Pretendard-Medium", size: FontSize.medium15.rawValue)!
        case .Regular:
            return UIFont(name: "Pretendard-Regular", size: FontSize.medium15.rawValue)!
        case .SemiBold:
            return UIFont(name: "Pretendard-SemiBold", size: FontSize.medium15.rawValue)!
        case .Thin:
            return UIFont(name: "Pretendard-Thin", size: FontSize.medium15.rawValue)!
        }
    }
    
    /// 아이폰 extraLarge 글씨(size: 16)
    var laergeFont: UIFont {
        switch self {
        case .Black:
            return UIFont(name: "Pretendard-Black", size: FontSize.large16.rawValue)!
        case .Bold:
            return UIFont(name: "Pretendard-Bold", size: FontSize.large16.rawValue)!
        case .ExtraBold:
            return UIFont(name: "Pretendard-ExtraBold", size: FontSize.large16.rawValue)!
        case .ExtraLight:
            return UIFont(name: "Pretendard-ExtraLight", size: FontSize.large16.rawValue)!
        case .Light:
            return UIFont(name: "Pretendard-Light", size: FontSize.large16.rawValue)!
        case .Medium:
            return UIFont(name: "Pretendard-Medium", size: FontSize.large16.rawValue)!
        case .Regular:
            return UIFont(name: "Pretendard-Regular", size: FontSize.large16.rawValue)!
        case .SemiBold:
            return UIFont(name: "Pretendard-SemiBold", size: FontSize.large16.rawValue)!
        case .Thin:
            return UIFont(name: "Pretendard-Thin", size: FontSize.large16.rawValue)!
        }
    }
    
    /// 아이폰 extraLarge 글씨(size: 18)
    var extraLargeFont: UIFont {
        switch self {
        case .Black:
            return UIFont(name: "Pretendard-Black", size: FontSize.extraLarge18.rawValue)!
        case .Bold:
            return UIFont(name: "Pretendard-Bold", size: FontSize.extraLarge18.rawValue)!
        case .ExtraBold:
            return UIFont(name: "Pretendard-ExtraBold", size: FontSize.extraLarge18.rawValue)!
        case .ExtraLight:
            return UIFont(name: "Pretendard-ExtraLight", size: FontSize.extraLarge18.rawValue)!
        case .Light:
            return UIFont(name: "Pretendard-Light", size: FontSize.extraLarge18.rawValue)!
        case .Medium:
            return UIFont(name: "Pretendard-Medium", size: FontSize.extraLarge18.rawValue)!
        case .Regular:
            return UIFont(name: "Pretendard-Regular", size: FontSize.extraLarge18.rawValue)!
        case .SemiBold:
            return UIFont(name: "Pretendard-SemiBold", size: FontSize.extraLarge18.rawValue)!
        case .Thin:
            return UIFont(name: "Pretendard-Thin", size: FontSize.extraLarge18.rawValue)!
        }
    }
}

final class FontManager {
    static let shared = FontManager()
    /// 저장된 폰트 가져오기
    func getFont(_ font: Int) -> Font {
        return Font(rawValue: font)!
    }
}
