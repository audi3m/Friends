//
//  UITextField+Ex.swift
//  Friends
//
//  Created by J Oh on 6/9/24.
//

import UIKit

class UnderlineTextField: UITextField {
    
    private lazy var underlineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .tamagotchiFontColor
        return lineView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(underlineView)
        config()
        
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        self.textColor = .tamagotchiFontColor
        self.textAlignment = .center
        
        
        
    }
    
}
