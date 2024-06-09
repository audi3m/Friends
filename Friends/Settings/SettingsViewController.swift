//
//  SettingsViewController.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit

class SettingsViewController: UIViewController {
     
    let tableView = UITableView()
    let ud = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tamagotchiBackground
        
        self.navigationItem.title = "설정"
        
        setTableView()
        
        configHierarchy()
        configLayout()
        configUI()
        
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.backgroundColor = .clear
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.id)
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
        cell.settingImageView.image = setting.image
        cell.settingLabel.text = setting.text
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = TamagotchiSettings(rawValue: indexPath.row)!
        switch setting {
        case .setName:
            navigationController?.pushViewController(EditUserViewController(), animated: true)
        case .chageTamagotchi:
            changeButtonClicked()
        case .reset:
            resetButtonClicked()
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func changeButtonClicked() {
        let vc = SelectionViewController(first: false)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func resetButtonClicked() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?",
                                      preferredStyle: .alert)
        
        let reset = UIAlertAction(title: "웅", style: .default) { _ in
            self.ud.firstOrReset = false
            self.ud.tamagotchi = nil
            self.dismiss(animated: true) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    let vc = SelectionViewController(first: true)
                    let nav = UINavigationController(rootViewController: vc)
                    window.rootViewController = nav
                }
            }
        }
        let cancel = UIAlertAction(title: "아냐!", style: .cancel)
        
        alert.addAction(reset)
        alert.addAction(cancel)
        
        present(alert, animated: true)
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
