//
//  reviewCollectionViewCell.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/19.
//

import UIKit

class reviewCollectionViewCell: UICollectionViewCell {
    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "게시글 제목"
        label.numberOfLines = 0  //1줄이면 1줄 넘어가면 알아서 중략
        
        return label
    }()
    
    
    //MARK: - Define Method

    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        
    }
    
    func Constraint() {
        
    }

    
}
