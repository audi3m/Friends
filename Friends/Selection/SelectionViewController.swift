//
//  SelectionViewController.swift
//  Friends
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class SelectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var first: Bool
    
    init(first: Bool) {
        self.first = first
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let list: [TamagotchiType?] = [
        .green, .orange, .pink,
        nil, nil, nil, nil, nil, nil, nil, nil, nil,
        nil, nil, nil, nil, nil, nil, nil, nil
    ]
    
    var selectionType: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tamagotchiBackground
        
        navigationItem.title = first ? "다마고치 선택하기" : "다마고치 변경하기"
        
        configureLayout()
        
        configHierarchy()
        configLayout()
        configUI()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(TamagotchiCollectionViewCell.self, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.id)
        
    }
    
}

extension SelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func configUI() {
        
    }
    
    func configureLayout() {
        let numberOfColumns: CGFloat = 3
        let cellPadding: CGFloat = 10
        let layout = UICollectionViewFlowLayout()
        
        let totalPadding = cellPadding * (numberOfColumns - 1)
        let itemWidth = (view.frame.width - 40 - totalPadding) / numberOfColumns
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.35)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = cellPadding
        
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.id, for: indexPath) as! TamagotchiCollectionViewCell
        if let type = list[indexPath.item] {
            cell.tamagotchiType = type
        } else {
            cell.tamagotchiType = nil
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select Item \(indexPath.item)")
        guard let tamagotchiType = list[indexPath.item] else { return }
        let vc = DetailViewController(tamagotchiType: tamagotchiType, first: first)
        vc.tamagotchiType = tamagotchiType
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
        
    }
    
}

