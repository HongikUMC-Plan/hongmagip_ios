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
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    lazy var naverButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "naver"), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(naverButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var kakaoButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakao"), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(kakaoButtonTapped(_:)), for: .touchUpInside)
        
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
        self.addSubview(categoryLabel)
        self.addSubview(naverButton)
        self.addSubview(kakaoButton)
        self.addSubview(centerLine)
        
    }
    
    private func Constraint() {
        restaurantLabelConstraint()
        naverButtonConstraint()
        kakaoButtonConstraint()
        centerLineConstraint()
        categoryLabelConstraint()
        
    }
    
    private func restaurantLabelConstraint () {
        restaurantLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(61)
        }
        
    }
    
    private func categoryLabelConstraint () {
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalTo(restaurantLabel.snp.trailing).offset(4)
            make.top.equalToSuperview().offset(68)
        }
        
    }
    
    private func kakaoButtonConstraint() {
        kakaoButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(221)
            make.width.equalTo(60)
            make.height.equalTo(25)
            
        }
    }
    
    private func naverButtonConstraint() {
        naverButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalTo(kakaoButton.snp.trailing).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(25)
            
        }
    }
    
    private func centerLineConstraint() {
        centerLine.snp.makeConstraints { make in
            make.width.equalTo(333)
            make.height.equalTo(2)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(115)
            
        }
    }
    //MARK: - Define Method
    func openURL(_ url: URL?) {
        guard let url = url else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @objc func naverButtonTapped(_ sender: UIButton) {
        if let restaurant = restaurantLabel.text {
            let url = getRestaurantLink(for: restaurant, platform: "naver")
            openURL(url)
        }
    }

    @objc func kakaoButtonTapped(_ sender: UIButton) {
        if let restaurant = restaurantLabel.text {
            let url = getRestaurantLink(for: restaurant, platform: "kakao")
            openURL(url)
        }
    }
    
        func configure(with restaurant: String) {
            restaurantLabel.text = restaurant
        }
        
        
    }
    
    

