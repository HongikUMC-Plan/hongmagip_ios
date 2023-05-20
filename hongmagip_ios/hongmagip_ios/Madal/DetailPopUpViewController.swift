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
    lazy var detailpopupview = DetailPopUpView()
    var collectionView: UICollectionView?
    
    lazy var bestRiviewLabel:UILabel = {
        let label = UILabel()
        label.text = "Best Rivew"
        label.font = UIFont(name: "Noto Sans", size: 16)
        label.textColor = .black
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetView()
        Constraint()
        
    }
    
    //cell 등록이 필수
    func registerCells() {
        collectionView?.register(reviewCollectionViewCell.self, forCellWithReuseIdentifier: "Identifier")
    }
    
    //MARK: - Properties


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
    
    
    
    

}




extension DetailPopUpViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
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
        cell.backgroundColor = .black
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 셀 내용의 크기에 따라 동적으로 셀 크기 계산
        let itemWidth = collectionView.bounds.width // 좌우 간격 제외한 너비
        let itemHeight: CGFloat = 100 // 기본 높이
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        /*if let 바인딩을 사용하는 이유는 옵셔널 체이닝을 통해 안전하게 셀을 가져오기 위함, collectionView.cellForItem(at: indexPath)는 인덱스 경로에 대한
        cell을 반환하는데, 해당 셀이 존재하지 않을 경우 발생하는 에러를 방지.*/
        if let cell = collectionView.cellForItem(at: indexPath) as? reviewCollectionViewCell {
            // 설정된 내용에 따라 셀의 높이를 계산하거나 업데이트
            let contentSize = cell.contentView.systemLayoutSizeFitting(itemSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
            return CGSize(width: itemWidth, height: contentSize.height)
        }
        
        return itemSize
    }

    
}
