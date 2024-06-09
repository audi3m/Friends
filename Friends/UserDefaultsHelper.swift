//
//  UserDefaultsHelper.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    var firstOrReset: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "firstOrReset")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "firstOrReset")
        }
    }
    
    var username: String {
        get {
            return UserDefaults.standard.string(forKey: "username") ?? "대장"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "username")
        }
    }
    
    var tamagotchi: Tamagotchi? {
        get {
            if let data = UserDefaults.standard.data(forKey: "tamagotchi") {
                let decoder = JSONDecoder()
                do {
                    let tamagotchi = try decoder.decode(Tamagotchi.self, from: data)
                    return tamagotchi
                } catch {
                    print("불러오기 실패")
                    return nil
                }
            }
            return nil
        }
        
        set {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: "tamagotchi")
            } catch {
                print("저장하기 실패")
            }
        }
    }
    
    
}


