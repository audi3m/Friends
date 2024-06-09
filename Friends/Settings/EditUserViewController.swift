//
//  EditUserViewController.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class EditUserViewController: UIViewController {
    
    let ud = UserDefaultsManager.shared
    
    let nameTextField = UnderlineTextField() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tamagotchiBackground
        
        configNavBar()
        
        nameTextField.delegate = self
        
        configHierarchy()
        configLayout()
        configUI()
        
    }
    
    func configNavBar() {
        navigationItem.title = "대장님 이름 정하기"
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveName)) 
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func configHierarchy() {
        view.addSubview(nameTextField)
    }
    
    func configLayout() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(45)
        }
         
    }
    
    func configUI() {
        nameTextField.text = ud.username
        nameTextField.font = .systemFont(ofSize: 15)
        nameTextField.placeholder = "이름을 입력하세요"
        nameTextField.textAlignment = .left
    }
    
    @objc func saveName() {
        let text = nameTextField.text!
        if text.count >= 2 && text.count <= 6 {
            ud.username = text
            navigationController?.popViewController(animated: true)
        } else {
            nameTextField.text = ""
            nameTextField.placeholder = "2글자 이상 6글자 이하로 입력해주세요"
        }
    }
    
}

extension EditUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveName()
        return true
    }
}
