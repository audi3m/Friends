//
//  SettingsTableViewCell.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    let settingImageView = UIImageView()
    let settingLabel = UILabel()
    let nameLabel = UILabel()
    let arrowImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configLayout()
        configUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        contentView.addSubview(settingImageView)
        contentView.addSubview(settingLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(arrowImageView)
    }
    
    func configLayout() {
        settingImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(20)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(settingImageView.snp.trailing).offset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-15)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-20)
        }
        
        
    }
    
    func configUI() {
        settingImageView.tintColor = .tamagotchiFontColor
        
        settingLabel.textColor = .black
        settingLabel.font = .systemFont(ofSize: 15)
        
        nameLabel.textColor = .tamagotchiFontColor
        nameLabel.font = .systemFont(ofSize: 13)
        
        arrowImageView.tintColor = .lightGray
        arrowImageView.image = UIImage(systemName: "chevron.right")
        
    }
    
    
}
