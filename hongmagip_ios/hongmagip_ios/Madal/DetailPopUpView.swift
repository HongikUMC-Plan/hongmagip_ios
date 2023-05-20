//
//  DetailPopUpView.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/17.
//

import UIKit
import SnapKit


class DetailPopUpView: UIScrollView {
    //MARK: - UI ProPerties
    lazy var restaurantLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var naverButton:UIButton = {
       let button = UIButton()
        button.setTitle("NAVER", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Noto Sans", size: 14)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
 
        return button
    }()
    
    lazy var kakaoButton:UIButton = {
       let button = UIButton()
        button.setTitle("KAKAO", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Noto Sans", size: 20)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var centerLine:UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
  
    //MARK: - Properties

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Set Ui
    private func SetView() {
        backgroundColor = .white
        self.addSubview(restaurantLabel)
        self.addSubview(naverButton)
        self.addSubview(kakaoButton)
        self.addSubview(centerLine)
    }
    
    private func Constraint() {
        restaurantLabelConstraint()
        naverButtonConstraint()
        kakaoButtonConstraint()
        centerLineConstraint()
        
    }
    
    private func restaurantLabelConstraint () {
        restaurantLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(20)
        }
        
    }
    
    private func naverButtonConstraint() {
        naverButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(15)
            
        }
    }
    
    private func kakaoButtonConstraint() {
        kakaoButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalTo(naverButton.snp.trailing).offset(8)
            
        }
    }
    
    private func centerLineConstraint() {
        centerLine.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(128)
            
        }
    }
    //MARK: - Define Method
//
    
    func configure(with restaurant: String) {
        restaurantLabel.text = restaurant
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        
    }
    
    
   
}


