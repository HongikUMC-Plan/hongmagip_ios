//
//  ViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/15.
//

import UIKit
import SnapKit

struct MealCategory {
    let name: String
    let restaurants: [String]
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: - UI Properties
    var collectionView: UICollectionView?
    
    lazy var popButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.frame.fill"), for: .normal)
        button.addTarget(self, action: #selector(popButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var popUpView = DetailPopUpView()
    
    //MARK: - Properties
    let categories: [MealCategory] = [
        MealCategory(name: "한식", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "중식", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "일식", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "양식", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "홍익대 맛집", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "아시안", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "페·푸", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "분식", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"]),
        MealCategory(name: "기타", restaurants: ["식당1", "식당2", "식당3", "식당4", "식당5", "식당6", "식당7", "식당8", "식당9"])
    ]
    
    var selectedCategory: MealCategory?
    
    //MARK: - Define Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        constraint()
        configurePopButton()
        configurePopupView()
        
    }
    
    @objc func popButtonTapped(_ sender: UIButton) {
        selectedCategory = nil
        collectionView!.reloadData()
        configurePopButton()
    }
    
    func configurePopButton() {
        if selectedCategory != nil {
            popButton.isHidden = false
        } else {
            popButton.isHidden = true
        }
    }
    
    func showPopup(with restaurant: String) {
        popUpView.setRestaurant(restaurant)
        popUpView.isHidden = false
     }
    
    func configurePopupView() {
        view.addSubview(popUpView)
        popUpView.isHidden = true
    }
    
    //MARK: - Set UI
    func setView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        if let collectionView = collectionView {
            view.addSubview(collectionView)
            self.view.addSubview(popButton)
        }
    }
    
    func constraint() {
        collectionViewConstraint()
        popButtonConstraint()
    }
    
    func collectionViewConstraint() {
        collectionView?.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(self.view.bounds.width)
            make.height.equalTo(self.view.bounds.width)
        }
    }
    
    func popButtonConstraint() {
        popButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(600)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(200)
        }
    }
    
    
}


//MARK: - Extension
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        collectionView.reloadData()
        configurePopButton()
        
        if let selectedCategory = selectedCategory {
            let restaurant = selectedCategory.restaurants[indexPath.row]
            showPopup(with: restaurant)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! CollectionViewCell
        
        if let selectedCategory = selectedCategory {
            let restaurant = selectedCategory.restaurants[indexPath.row]
            cell.configure(with: restaurant)
            cell.likeButton.isHidden = false
            
            
        } else {
            let category = categories[indexPath.row].name
            cell.configure(with: category)
            cell.likeButton.isHidden = true
        }
        
        cell.backgroundColor = .cyan
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1 // 3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        let size = CGSize(width: width, height: width)
        return size
    }
    
    
    
}
