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
    let restaurants: [Restaurant]
}

//struct Restaurant {
//    let name: String
//    var isLiked: Bool = false
//}

class Restaurant {
    let name: String
    var isLiked: Bool = false
    
    init(name: String) {
        self.name = name
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewCellDelegate {
    
    
    
    //MARK: - UI Properties
    var collectionView: UICollectionView?
    
    lazy var popButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.frame.fill"), for: .normal)
        button.addTarget(self, action: #selector(popButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var popUpView = DetailPopUpViewController()
    
    //MARK: - Properties
    let categories: [MealCategory] = [
        MealCategory(name: "한식", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "중식", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "일식", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "양식", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "홍익대 맛집", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "아시안", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "페·푸", restaurants: [
            Restaurant(name: "햄버거"),
            Restaurant(name: "피자"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "분식", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        MealCategory(name: "기타", restaurants: [
            Restaurant(name: "식당1"),
            Restaurant(name: "식당2"),
            Restaurant(name: "식당3"),
            Restaurant(name: "식당4"),
            Restaurant(name: "식당5"),
            Restaurant(name: "식당6"),
            Restaurant(name: "식당7"),
            Restaurant(name: "식당8"),
            Restaurant(name: "식당9")
        ]),
        
        
        
    ]
    
    var selectedCategory: MealCategory?
    var clickcnt = 0
    var restaurantStates: [IndexPath: Bool] = [:]
    
    
    
    //MARK: - Define Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        constraint()
        configurePopButton()
        
        
    }
    
    @objc func popButtonTapped(_ sender: UIButton) {
        selectedCategory = nil
        collectionView!.reloadData()
        configurePopButton()
        clickcnt =  0
    }
    
    func configurePopButton() {
        if selectedCategory != nil {
            popButton.isHidden = false
        } else {
            popButton.isHidden = true
        }
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
                clickcnt += 1
                if clickcnt > 1 {
                    let restaurant = selectedCategory.restaurants[indexPath.row]
                    if !restaurant.isLiked {
                        restaurant.isLiked = true
                        collectionView.reloadItems(at: [indexPath])
                    }
                    present(popUpView, animated: true)
                    popUpView.detailpopupview.restaurantLabel.text = restaurant.name
                }
                
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! CollectionViewCell
            cell.delegate = self
            
            if let selectedCategory = selectedCategory {
                let restaurant = selectedCategory.restaurants[indexPath.row]
                cell.configure(with: restaurant.name)
                cell.likeButton.isHidden = false
                cell.likeButton.isSelected = restaurantStates[indexPath] ?? false
                
                
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
        
        func likeButtonTapped(for cell: CollectionViewCell) {
            guard let indexPath = collectionView?.indexPath(for: cell) else { return }
            
            if let selectedCategory = selectedCategory {
                let restaurant = selectedCategory.restaurants[indexPath.row]
                let isLiked = !(restaurantStates[indexPath] ?? false)  // Invert the current state
                restaurantStates[indexPath] = isLiked  // Store the updated state
                cell.likeButton.isSelected = isLiked  // Update the likeButton state in the cell
            }
        }
        
        func getSelectedRestaurantTitles() -> [String] {
            var selectedTitles: [String] = []
            
            for (indexPath, isSelected) in restaurantStates {
                if isSelected {
                    let category = categories[indexPath.section]
                    let restaurant = category.restaurants[indexPath.row]
                    selectedTitles.append(restaurant.name)
                }
            }
            return selectedTitles
        }
        
    }
    
    
    

