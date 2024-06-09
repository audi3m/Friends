//
//  DetailViewController.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let ud = UserDefaultsManager.shared
    
    let backgroundView = UIView()
    let imageView = UIImageView()
    let nameLabel = PaddedLabel()
    let divider = UIView()
    let descLabel = UILabel()
    let buttonDivider = UIView()
    let cancelButton = UIButton()
    let confirmButton = UIButton()
    
    var tamagotchiType: TamagotchiType
    var first: Bool
    
    init(tamagotchiType: TamagotchiType, first: Bool) {
        self.tamagotchiType = tamagotchiType
        self.first = first
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        
        
        configHierarchy()
        configLayout()
        configUI()
        
    }
    
    func configHierarchy() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(imageView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(divider)
        backgroundView.addSubview(descLabel)
        backgroundView.addSubview(buttonDivider)
        backgroundView.addSubview(cancelButton)
        backgroundView.addSubview(confirmButton)
        
    }
    
    func configLayout() {
        backgroundView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(view.snp.height).multipliedBy(0.6)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.top.equalTo(backgroundView.snp.top).offset(50)
            make.size.equalTo(backgroundView.snp.width).multipliedBy(0.4)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            
        }
        
        divider.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.75)
            make.height.equalTo(1)
            
        }
        
        descLabel.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundView.snp.centerX)
            make.top.equalTo(divider.snp.bottom).offset(30)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.75)
        }
        
        buttonDivider.snp.makeConstraints { make in
            make.bottom.equalTo(cancelButton.snp.top)
            make.width.equalTo(backgroundView.snp.width)
            make.height.equalTo(1)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundView.snp.bottom)
            make.leading.equalTo(backgroundView.snp.leading)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.5)
            make.height.equalTo(50)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundView.snp.bottom)
            make.trailing.equalTo(backgroundView.snp.trailing)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.5)
            make.height.equalTo(50)
        }
        
        
    }
    
    func configUI() {
        backgroundView.backgroundColor = .tamagotchiBackground
        backgroundView.layer.cornerRadius = 10
        
        imageView.image = tamagotchiType.profileImage
        nameLabel.text = tamagotchiType.fullname
        descLabel.text = tamagotchiType.typedesc
        
        nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        divider.backgroundColor = .tamagotchiFontColor
        
        descLabel.textAlignment = .center
        descLabel.numberOfLines = 0
        descLabel.textColor = .tamagotchiFontColor
        descLabel.font = .systemFont(ofSize: 13)
        
        buttonDivider.backgroundColor = .tamagotchiFontColor.withAlphaComponent(0.3)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.tamagotchiFontColor, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        cancelButton.backgroundColor = .black.withAlphaComponent(0.1)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        
        confirmButton.setTitle(first ? "시작하기" : "변경하기", for: .normal)
        confirmButton.setTitleColor(.tamagotchiFontColor, for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        
        
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    @objc func confirm() {
        if first {
            ud.tamagotchi = Tamagotchi(type: self.tamagotchiType)
            ud.firstOrReset = true
            
        } else {
            ud.tamagotchi?.type = self.tamagotchiType
        }
        
        dismiss(animated: true) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                let vc = MainViewController()
                let nav = UINavigationController(rootViewController: vc)
                window.rootViewController = nav
            }
        }
    }
    
    
}
