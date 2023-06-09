//
//  lCollectionViewCell.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/16.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
//        label.font = UIFont(name: "Pretendard-Bold", size: 32)
//        label.font = UIFont.hongFont.ExtraBold
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.semibold)

        return label
    }()
    
    lazy var likeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(likeButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var logo:UIButton = {
        let button = UIButton()
        return button
    }()
    
  
    
    
    //MARK: - Properties
    
    var isLiked: Bool = false
    
    weak var delegate: CollectionViewCellDelegate?
    
    
    
    //MARK: - Define Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.likeButtonTapped(for: self)
       
    }
    
    //MARK: - Set Ui
    func SetView() {
        self.addSubview(titleLabel)
        self.addSubview(likeButton)
        self.addSubview(logo)
        self.layer.cornerRadius = 10
    }
    
    func Constraint() {
        titleLabelConstraint()
        likeButtonConstraint()
        logoConstraint()
        
    }
    
    
    func titleLabelConstraint() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func likeButtonConstraint() {
        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(23)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func logoConstraint() {
        logo.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configure(with category: String) {
        titleLabel.text = category
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeButton.isSelected = false
    }
    
    
}


protocol CollectionViewCellDelegate: AnyObject {
    func likeButtonTapped(for cell: MainCollectionViewCell)
}
