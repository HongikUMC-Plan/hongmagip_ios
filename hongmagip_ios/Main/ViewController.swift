//
//  ViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/15.
//

import UIKit
import SnapKit
import GoogleMobileAds

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewCellDelegate {
    
    //MARK: - UI Properties
    var collectionView: UICollectionView?
    
    lazy var popUpView = DetailPopUpViewController()
    lazy var randomView = randomViewController()
    
    lazy var popButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(popButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var randomButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "random"), for: .normal)
        button.addTarget(self, action: #selector(randomButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var instaButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.addTarget(self, action: #selector(instaButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var admobView: GADBannerView = { // admob 부분
        var view = GADBannerView()
        let id = "ca-app-pub-6434961075836011/7218713457"
        view.adUnitID = id
        view.load(GADRequest())
        
        return view
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
        guard let url = URL(string: "https://www.instagram.com/hongik_mumukji/?igshid=OGQ5ZDc2ODk2ZA%3D%3D") else {
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
        admobViewSetView()
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
    
    func admobViewSetView(){
        admobView.rootViewController = self
        admobView.delegate = self
        self.view.addSubview(admobView)
    }
    
    func Constraint() {
        collectionViewConstraint()
        popButtonConstraint()
        randomButtonConstraint()
        instaButtonConstraint()
        admobViewConstraint()
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
            make.top.equalTo(collectionView!.snp.bottom).offset(29)
            //            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(661)
            make.leading.equalTo(133)
        }
    }
    
    func instaButtonConstraint() {
        instaButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalTo(collectionView!.snp.bottom).offset(29)
            //            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(661)
            make.leading.equalTo(randomButton.snp.trailing).offset(40)
            
        }
    }
    
    func admobViewConstraint() {
        admobView.snp.makeConstraints { make in
            make.width.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
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
        var updatedSelectedCategory: MealCategory?
        
        if let selectedCategory = selectedCategory {
            let restaurant = selectedCategory.restaurants[indexPath.row]
            let restaurantName = restaurant.name
            
            
            // Check if the selected restaurant exists in other categories
            for category in categories {
                if category.name != selectedCategory.name {
                    for otherRestaurant in category.restaurants {
                        if otherRestaurant.name == restaurantName {
                            // Found the restaurant in a different category
                            updatedSelectedCategory = category
                            break
                        }
                    }
                }
            }
            
            // The selected restaurant does not exist in other categories
            clickcnt += 1
            if clickcnt > 1 {
                if !restaurant.isLiked {
                    restaurant.isLiked = true
                    collectionView.reloadItems(at: [indexPath])
                }
                present(popUpView, animated: true)
                popUpView.detailpopupview.restaurantLabel.text = restaurantName
                popUpView.selectedCategory = selectedCategory // 선택된 카테고리를 할당합니다.
                popUpView.detailpopupview.categoryLabel.text = selectedCategory.name // 카테고리 이름을 categoryLabel에 할당합니다.
            }
        } else {
            updatedSelectedCategory = categories[indexPath.row]
        }
        
        if let updatedSelectedCategory = updatedSelectedCategory {
            selectedCategory = updatedSelectedCategory
            collectionView.reloadData()
            configurePopButton()
        }
        
        configureFirstButton()
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! MainCollectionViewCell
        cell.delegate = self
        
        if let selectedCategory = selectedCategory {
            let restaurant = selectedCategory.restaurants[indexPath.row]
            var formattedName = restaurant.name
            
            if restaurant.name.count > 10 {
                let index = restaurant.name.index(restaurant.name.startIndex, offsetBy: 4)
                formattedName.insert("\n", at: index)
            }
            
            cell.configure(with: formattedName)
            cell.likeButton.isHidden = false
            cell.likeButton.isSelected = restaurantStates[indexPath] ?? false
            cell.backgroundColor = UIColor.PM.mainBlue
            cell.logo.setImage(nil, for: .normal)
        }
        else {
            let category = categories[indexPath.row].name
            cell.configure(with: category)
            cell.likeButton.isHidden = true
            // Check if it's the 5th cell
            if indexPath.row == 4 {
                //categories에서 5번 째 cell color 변경
                cell.backgroundColor = UIColor.white
                cell.titleLabel.text  = "로고"
                cell.logo.setImage(UIImage(named: "로고") , for: .normal)
                
            } else {
                cell.backgroundColor = UIColor.PM.mainBlue
                cell.titleLabel.text = category
                cell.logo.setImage(nil, for: .normal)
            }
            
            // Reset the background color for non-selected category cells
        }
        
        return cell
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 3 // 3등분하여 배치, 옆 간격을 빼줌.
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

extension ViewController : GADBannerViewDelegate {
    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 10) {
            bannerView.alpha = 1
        }
    }
}
