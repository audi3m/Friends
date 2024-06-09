//
//  MainViewController.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let ud = UserDefaultsManager.shared
    
    let dialogImageView = UIImageView()
    let dialogLabel = UILabel()
    let tamagotchiImageView = UIImageView()
    let nameLabel = PaddedLabel()
    let stateLabel = UILabel()
    let foodTextField = UnderlineTextField()
    let foodButton = UIButton()
    let waterTextField = UnderlineTextField()
    let waterButton = UIButton()
    
    let foodStackView = UIStackView()
    let waterStackView = UIStackView()
    
    var tamagotchi: Tamagotchi? {
        didSet {
            ud.tamagotchi = self.tamagotchi
            setTamagotchi()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "\(ud.username)님의 다마고치"
        dialogLabel.text = "\(ud.username)님\n" + (helloText.randomElement() ?? "안녕하세요~~")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tamagotchiBackground
        
        self.tamagotchi = ud.tamagotchi
        
        
        
        configNavBar()
        
        configHierarchy()
        configLayout()
        configUI()
        
        setButtonsFunction()
        
        foodTextField.delegate = self
        waterTextField.delegate = self
        
    }
    
    func configNavBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.shadowImage = nil
        
        navigationItem.title = "\(ud.username)님의 다마고치"
        let profile = UIBarButtonItem(image: .profile,
                                      style: .plain, target: self,
                                      action: #selector(profileButtonClicked))
        
        navigationItem.rightBarButtonItem = profile
        
    }
    
    func configHierarchy() {
        
        foodStackView.axis = .horizontal
        foodStackView.spacing = 20
        foodStackView.addArrangedSubview(foodTextField)
        foodStackView.addArrangedSubview(foodButton)
        
        waterStackView.axis = .horizontal
        waterStackView.spacing = 20
        waterStackView.addArrangedSubview(waterTextField)
        waterStackView.addArrangedSubview(waterButton)
        
        view.addSubview(dialogImageView)
        view.addSubview(dialogLabel)
        view.addSubview(tamagotchiImageView)
        view.addSubview(nameLabel)
        view.addSubview(stateLabel)
        view.addSubview(foodStackView)
        view.addSubview(waterStackView)
        
    }
    
    func configLayout() {
        
        dialogImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(150)
            
        }
        
        dialogLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(dialogImageView.snp.top).offset(10)
            make.bottom.equalTo(dialogImageView.snp.bottom).offset(-30)
            make.leading.equalTo(dialogImageView.snp.leading).offset(40)
            make.trailing.equalTo(dialogImageView.snp.trailing).offset(-40)
            
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(dialogImageView.snp.bottom).offset(10)
            make.size.equalTo(170)
            
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.height.equalTo(24)
            
        }
        
        foodTextField.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        foodButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        waterTextField.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        waterButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        foodStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(stateLabel.snp.bottom).offset(30)
        }
        
        waterStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(foodStackView.snp.bottom).offset(20)
        }
        
        
    }
    
    func configUI() {
        setTamagotchi()
        
        dialogImageView.image = .bubble
        dialogImageView.contentMode = .scaleAspectFit
        
        dialogLabel.numberOfLines = 0
        dialogLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        dialogLabel.textColor = .tamagotchiFontColor
        
        tamagotchiImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        
        stateLabel.textAlignment = .center
        stateLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        stateLabel.textColor = .tamagotchiFontColor
        
        foodTextField.placeholder = "밥주세용"
        foodTextField.font = .systemFont(ofSize: 14, weight: .semibold)
        
        waterTextField.placeholder = "물주세용"
        waterTextField.font = .systemFont(ofSize: 14, weight: .semibold)
        
        foodButton.setImage(.food, for: .normal)
        foodButton.setTitle(" 밥먹기", for: .normal)
        foodButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        foodButton.setTitleColor(.tamagotchiFontColor, for: .normal)
        foodButton.tintColor = .tamagotchiFontColor
        foodButton.layer.cornerRadius = 5
        foodButton.layer.borderWidth = 1
        foodButton.layer.borderColor = UIColor.tamagotchiFontColor.cgColor
        
        waterButton.setImage(.water, for: .normal)
        waterButton.setTitle(" 물먹기", for: .normal)
        waterButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        waterButton.setTitleColor(.tamagotchiFontColor, for: .normal)
        waterButton.tintColor = .tamagotchiFontColor
        waterButton.layer.cornerRadius = 5
        waterButton.layer.borderWidth = 1
        waterButton.layer.borderColor = UIColor.tamagotchiFontColor.cgColor
        
    }
    
    func setTamagotchi() {
        if let tamagotchi = ud.tamagotchi {
            tamagotchiImageView.image = tamagotchi.image
            nameLabel.text = tamagotchi.type.fullname
            stateLabel.text = tamagotchi.userDesc
        }
    }
    
    func setButtonsFunction() {
        foodButton.addTarget(self, action: #selector(giveFood), for: .touchUpInside)
        waterButton.addTarget(self, action: #selector(giveWater), for: .touchUpInside)
    }
    
    @objc func profileButtonClicked() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func giveFood() {
        let text = foodTextField.text!
        let level = tamagotchi?.level
        if text.isEmpty {
            tamagotchi?.food += 1
            self.dialogLabel.text = "물도 주세요 \(ud.username)님"
        } else {
            if let num = Int(text) {
                if num >= 1 && num <= 99 {
                    tamagotchi?.food += num
                    self.dialogLabel.text = "맛있어요 \(ud.username)님"
                    foodTextField.placeholder = "밥주세용"
                } else {
                    dialogLabel.text = "100개 이상은 힘들어요"
                    foodTextField.placeholder = "99개 이하로 주세요"
                }
            }
        }
        
        if tamagotchi?.level ?? 0 > level ?? 0 {
            dialogLabel.text = "레벨업 했어요~!\n고마워요 \(ud.username)님"
        }
        
        foodTextField.text = ""
        
    }
    
    @objc func giveWater() {
        let text = waterTextField.text!
        let level = tamagotchi?.level
        if text.isEmpty {
            tamagotchi?.water += 1
            self.dialogLabel.text = "밥도 주세요 \(ud.username)님"
        } else {
            if let num = Int(text) {
                if num >= 1 && num <= 49 {
                    tamagotchi?.water += num
                    self.dialogLabel.text = "시원해요 \(ud.username)님"
                    waterTextField.placeholder = "물주세용"
                } else {
                    dialogLabel.text = "50개 이상은 힘들어요"
                    waterTextField.placeholder = "49개 이하로 주세요"
                }
            }
        }
        
        if tamagotchi?.level ?? 0 > level ?? 0 {
            dialogLabel.text = "레벨업 했어요~!\n고마워요 \(ud.username)님"
        }
        waterTextField.text = ""
    }
    
    
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    
    
    
}
