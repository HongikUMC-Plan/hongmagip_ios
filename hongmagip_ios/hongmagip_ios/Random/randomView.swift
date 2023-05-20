//
//  randomView.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import UIKit
import SnapKit

class randomView: UIView {

    //MARK: - UI ProPerties
    lazy var titleLabel:UILabel = {
       let label = UILabel()
        label.text = "랜덤 선택"
        label.font = UIFont(name: "Noto Sans", size: 20)
        label.textColor = .black
        
        return label
        
    }()
    
    lazy var name:String = "식당"
    
    lazy var randomRestaurant:UIButton = {
        let button = UIButton()
        button.setTitle("\(name)", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.basic
        button.addTarget(self, action: #selector(randomRestaurantTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .gray

        return button
        
    }()
    
    lazy var randomButton:UIButton = {
        let button = UIButton()
        button.setTitle("렌덤 돌리기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.basic
        button.addTarget(self, action: #selector(randomButtonTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.backgroundColor = .gray
        

        return button
        
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
    
    @objc func randomRestaurantTapped(_ sender: UIButton) {
       
    }
    
    @objc func randomButtonTapped(_ sender: UIButton) {
        let random = getRandomRestaurant()
        if let restaurant = random {
            name = restaurant.name
            randomRestaurant.setTitle("\(name)", for: .normal)
            
        }
    }
   

    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        self.backgroundColor = .white
        self.addSubview(titleLabel)
        self.addSubview(randomRestaurant)
        self.addSubview(randomButton)
    }
    
    func Constraint() {
        titleLabelConstraint()
        randomRestaurantConstraint()
        randomButtonConstraint()
        
    }
    
    func titleLabelConstraint(){
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(80)
            
        }
    }
    
    func randomRestaurantConstraint(){
        randomRestaurant.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(150)
            make.width.height.equalTo(175)
        }
    }
    
    func randomButtonConstraint(){
        randomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(randomRestaurant.snp.bottom).offset(30)
            make.width.equalTo(107)
            make.height.equalTo(24)
        }
        
    }
}
