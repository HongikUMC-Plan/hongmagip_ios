//
//  DetailPopUpViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/18.
//

import UIKit
import SnapKit

class DetailPopUpViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    //MARK: - UI ProPerties
    
    lazy var bestRiviewLabel:UILabel = {
        let label = UILabel()
        label.text = "Best Rivew"
        label.font = UIFont(name: "Noto Sans", size: 16)
        label.textColor = .black
        
        return label
    }()
    
    let instance = FetchData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetView()
        Constraint()
        instance.fetchData()
    }
    
    //MARK: - Properties
    lazy var detailpopupview = DetailPopUpView()
    var collectionView: UICollectionView?
    var blogs: [Blog] = []
    var selectedCategory: MealCategory?
    
    

    


    //MARK: - Set Ui

    func SetView() {
        self.view.backgroundColor = .white
        self.view.addSubview(detailpopupview)
        self.view.addSubview(bestRiviewLabel) 
        collectionViewSetView()
    }
    
    func collectionViewSetView(){
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
        registerCells()
    }
    
    func registerCells() {
        collectionView?.register(reviewCollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
    }
    
    func Constraint() {
        detailpopupviewConstraint()
        collectionViewConstraint()
        bestRiviewLabelConstraint()
    }
    
    func detailpopupviewConstraint() {
        detailpopupview.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(130)
        }
        
    }
    
    func bestRiviewLabelConstraint() {
        bestRiviewLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(detailpopupview.snp.bottom).offset(20)
        }
    }

    func collectionViewConstraint() {
        collectionView?.snp.makeConstraints { make in
            make.leading.trailing.width.equalToSuperview()
            make.top.equalTo(bestRiviewLabel.snp.bottom).offset(20)
            make.height.equalTo(670)
        }
    }
    
    func configure(with restaurant: String) {
        detailpopupview.restaurantLabel.text = restaurant
    }
    
//    @objc func naverButtonTapped(_ sender: UIButton) {
//        guard let url = URL(string: "https://www.instagram.com/hongik_mumukji/?igshid=OGQ5ZDc2ODk2ZA%3D%3D") else {
//            return
//        }
//        
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
//    
//    @objc func kakaoButtonTapped(_ sender: UIButton) {
//        guard let url = URL(string: "https://www.instagram.com/hongik_mumukji/?igshid=OGQ5ZDc2ODk2ZA%3D%3D") else {
//            return
//        }
//        
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
    
    
    
    

}

extension DetailPopUpViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! reviewCollectionViewCell
        let blog = blogs[indexPath.row] // 파싱된 블로그 데이터 배열에서 해당 인덱스의 데이터 가져오기
        cell.titleLabel.text = blog.title // 셀의 titleLabel에 블로그 제목 할당
        cell.blogRivew.text = blog.description
            return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }


    
}
