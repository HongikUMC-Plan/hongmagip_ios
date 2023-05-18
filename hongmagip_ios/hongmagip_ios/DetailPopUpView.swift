//
//  DetailPopUpView.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/17.
//

import UIKit
import SnapKit


class DetailPopUpView: UIView {
    private let restaurantLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(DetailPopUpView.self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        constraintSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        backgroundColor = .white
        addSubview(restaurantLabel)
        addSubview(closeButton)
    }
    
    private func constraintSubviews() {
        restaurantLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(20)
        }
    }
    
    @objc private func closeButtonTapped(_ sender: UIButton) {
        self.isHidden = true
    }
    
    func setRestaurant(_ restaurant: String) {
        restaurantLabel.text = restaurant
    }
}

