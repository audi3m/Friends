//
//  SettingsViewController.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let navBar = UINavigationBar()
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tamagotchiBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.backgroundColor = .tamagotchiBackground
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.id)
        
        configHierarchy()
        configLayout()
        configUI()
        
    }
    
    func configHierarchy() {
        view.addSubview(tableView)
    }
    
    func configLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configUI() {
        
    }
    
    
    
    
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TamagotchiSettings.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.id, for: indexPath) as! SettingsTableViewCell
        let setting = TamagotchiSettings(rawValue: indexPath.row)!
        cell.backgroundColor = .clear
        cell.settingImageView.image = setting.image
        cell.settingLabel.text = setting.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

enum TamagotchiSettings: Int, CaseIterable {
    case setName
    case chageTamagotchi
    case reset
    
    var image: UIImage {
        switch self {
        case .setName: .pencil
        case .chageTamagotchi: .moon
        case .reset: .arrow
        }
    }
    
    var text: String {
        switch self {
        case .setName:
            "내 이름 설정하기"
        case .chageTamagotchi:
            "다마고치 변경하기"
        case .reset:
            "데이터 초기화"
        }
    }
    
    
}
