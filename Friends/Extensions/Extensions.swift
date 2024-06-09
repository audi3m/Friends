//
//  Extensions.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

extension UIColor {
    static let tamagotchiBackground = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    static let tamagotchiFontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
}

extension UIImage {
    static let food = UIImage(systemName: "drop.circle")!
    static let water = UIImage(systemName: "leaf.circle")!
    static let pencil = UIImage(systemName: "pencil")!
    static let moon = UIImage(systemName: "moon.fill")!
    static let arrow = UIImage(systemName: "arrow.clockwise")!
    static let profile = UIImage(systemName: "person.circle")
}

extension UITableViewCell {
    static var id: String {
        String(describing: self)
    }
}

extension UICollectionViewCell {
    static var id: String {
        String(describing: self)
    }
}

extension UIViewController {
    static var id: String {
        String(describing: self)
    }
}

extension Date {
    func today() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "오늘은 M월 d일 EEEE입니다"
        
        return dateFormatter.string(from: self)
    }
}

let helloText: [String] = [
    "오늘 날씨가 좋네요~~", "식사는 하셨나요?", "과제는 다 하셨나요?",
    "반가워요~!\n\(Date.now.today())", "복습하세요",
    ""
]
