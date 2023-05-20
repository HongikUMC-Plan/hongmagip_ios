//
//  ViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/15.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewCellDelegate {
    
    //MARK: - UI Properties
    var collectionView: UICollectionView?
    
    lazy var popUpView = DetailPopUpViewController()
    lazy var randomView = randomViewController()
    
    lazy var popButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.frame.fill"), for: .normal)
        button.addTarget(self, action: #selector(popButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var randomButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.frame.fill"), for: .normal)
        button.addTarget(self, action: #selector(randomButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var instaButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.frame.fill"), for: .normal)
        button.addTarget(self, action: #selector(instaButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    
    //MARK: - Properties

    
    var selectedCategory: MealCategory?
    var clickcnt = 0
    var restaurantStates: [IndexPath: Bool] = [:]
    
    
    
    //MARK: - Define Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        Constraint()
        configurePopButton()
        configureFirstButton()

    }
    
    @objc func popButtonTapped(_ sender: UIButton) {
        selectedCategory = nil
        collectionView!.reloadData()
        configurePopButton()
        clickcnt = 0
        popButton.isSelected = false
        configureFirstButton()
    }

    
    @objc func randomButtonTapped(_ sender: UIButton) {
        present(randomView, animated:true)
    }
    
    @objc func instaButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://www.instagram.com/lyoodong") else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func configurePopButton() {
        if selectedCategory != nil {
            popButton.isHidden = false
        } else {
            popButton.isHidden = true
        }
    }
    
    // 조건을 위해 논리 연산자 사용
    func configureFirstButton() {
        if selectedCategory == nil || popButton.isSelected {
            instaButton.isHidden = false
            randomButton.isHidden = false
        } else {
            instaButton.isHidden = true
            randomButton.isHidden = true
        }
    }


    
    
    
    //MARK: - Set UI
    func setView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        if let collectionView = collectionView {
            view.addSubview(collectionView)
            self.view.addSubview(popButton)
            self.view.addSubview(randomButton)
            self.view.addSubview(instaButton)
        }
        
    }
    
    
    func Constraint() {
        collectionViewConstraint()
        popButtonConstraint()
        randomButtonConstraint()
        instaButtonConstraint()
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
            make.centerX.equalToSuperview()
        }
    }
    
    func randomButtonConstraint(){
        randomButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(600)
            make.leading.equalTo(111)
        }
    }
    
    func instaButtonConstraint() {
        instaButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(600)
            make.leading.equalTo(randomButton.snp.leading).offset(52)
            
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
            configureFirstButton()
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! MainCollectionViewCell
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
            
            cell.backgroundColor = .magenta
            
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 3 - 1 // 3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
            let size = CGSize(width: width, height: width)
            return size
        }
        
        func likeButtonTapped(for cell: MainCollectionViewCell) {
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
    
    
    

