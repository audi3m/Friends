//
//  Tamagotchi.swift
//  Friends
//
//  Created by J Oh on 6/9/24.
//

import UIKit

struct Tamagotchi: Codable {
    var type: TamagotchiType
    var food: Int = 0
    var water: Int = 0
    
    var userDesc: String {
        "LV\(level) · 밥알 \(food)개 · 물방울 \(water)개"
    }
    
    var image: UIImage {
        UIImage(named: "\(self.type.rawValue)-\(self.level)") ?? UIImage(systemName: "questionmark")!
    }
    var level: Int {
        switch (food/5 + water/2) {
        case 0..<20: 1
        case 20..<30: 2
        case 30..<40: 3
        case 40..<50: 4
        case 50..<60: 5
        case 60..<70: 6
        case 70..<80: 7
        case 80..<90: 8
        case 90..<100: 9
        case 100...: 10
        default: 1
        }
    }
    
}


enum TamagotchiType: Int, Codable {
    case green = 1
    case orange = 2
    case pink = 3
    
    var fullname: String {
        switch self {
        case .green:
            "따끔따끔 다마고치"
        case .orange:
            "방실방실 다마고치"
        case .pink:
            "반짝반짝 다마고치"
        }
    }
    
    var typedesc: String {
        switch self {
        case .green:
            "저는 초록색 다마고치입니다. 키는 10cm, 몸무게는 150g이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!!!"
        case .orange:
            "저는 주황색 다마고치입니다. 키는 2cm, 몸무게는 50g이에요. 저는 많이 먹지 않아도 잘 커서 키우기 쉬워요."
        case .pink:
            "저는 초록색 다마고치입니다. 키는 100cm, 몸무게는 1200g이에요. 저는 많이 먹습니다."
        }
    }
    
    var profileImage: UIImage {
        switch self {
        case .green:
            UIImage(named: "1-6")!
        case .orange:
            UIImage(named: "2-6")!
        case .pink:
            UIImage(named: "3-6")!
        }
    }
}

