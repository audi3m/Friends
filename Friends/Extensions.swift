//
//  Extensions.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit

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
}

extension UITableViewCell {
    static var id: String {
        String(describing: self)
    }
}

extension UIViewController {
    static var id: String {
        String(describing: self)
    }
}

