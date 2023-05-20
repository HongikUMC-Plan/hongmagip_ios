//
//  reviewCollectionViewCell.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/19.
//

import UIKit
import SnapKit

class reviewCollectionViewCell: UICollectionViewCell {
    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "게시글 제목"
        label.numberOfLines = 1  //1줄이면 1줄 넘어가면 알아서 중략
        
        return label
    }()
    
    lazy var blogRivew:UITextView = {
        let view = UITextView()
        view.backgroundColor = .white
        view.text = "예시글입니다."
        
        return view
    }()
    
    
    //MARK: - Define Method

    var instance = FetchData()
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
        instance.fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        self.addSubview(titleLabel)
        self.addSubview(blogRivew)
        self.backgroundColor = .white
        self.layer.borderWidth = 1.0 // 테두리 두께 설정
        self.layer.borderColor = UIColor.black.cgColor // 테두리 색상 설정
        self.layer.cornerRadius = 8.0 // 셀의 모서리 둥글기 설정
        self.layer.masksToBounds = true // 셀의 내용이 모서리를 넘어가지 않도록 설정

    }
    
    func Constraint() {
        titleLabelConstraint()
        blogRivewConstraint()
    }
    
    func titleLabelConstraint(){
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    func blogRivewConstraint() {
        blogRivew.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            
        }
        
    }

    
}
