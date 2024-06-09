//
//  TamagotchiCollectionViewCell.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class TamagotchiCollectionViewCell: UICollectionViewCell {
    let tamaImageView = UIImageView()
    let nameLabel = PaddedLabel()
    
    var tamagotchiType: TamagotchiType? {
        didSet {
            configUI()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configHierarchy()
        configLayout()
        configUI()
    }
    
    func configHierarchy() {
        contentView.addSubview(tamaImageView)
        contentView.addSubview(nameLabel)
    }
    
    func configLayout() {
        tamaImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.size.equalTo(contentView.snp.width).multipliedBy(0.8)
            
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(tamaImageView.snp.bottom).offset(5)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
        }
        
        
    }
    
    func configUI() {
        tamaImageView.image = tamagotchiType == nil ? UIImage(named: "noImage") : tamagotchiType?.profileImage
        tamaImageView.contentMode = .scaleAspectFit
        
        nameLabel.text = tamagotchiType == nil ? "준비중이에요" : tamagotchiType?.fullname
        nameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        nameLabel.adjustsFontSizeToFitWidth = true
        
    }
    
}



