//
//  DetailPopUpViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/18.
//

import UIKit
import SnapKit

class DetailPopUpViewController: UIViewController {
    
    lazy var detailpopupview = DetailPopUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetView()
        Constraint()
        
    }
    
    func SetView() {
        self.view.addSubview(detailpopupview)
        
    }
    
    func Constraint() {
        detailpopupview.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configure(with restaurant: String) {
        detailpopupview.restaurantLabel.text = restaurant
    }

}
