//
//  randomViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import UIKit
import SnapKit

class randomViewController: UIViewController, RandomViewDelegate {
    //MARK: - UI ProPerties
    var initialView = randomView()
    
    //MARK: - Define Method
    override func viewDidLoad() {
        super.viewDidLoad()
        SetView()
        Constraint()
        initialView.delegate = self
    }
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        self.view.backgroundColor = .white
        self.view.addSubview(initialView)
        
    }
    
    func Constraint() {
        initialView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
    }
     
    func didTapRandomRestaurant(withName name: String) {
        let destinationVC = DetailPopUpViewController() // 대상 ViewController를 적절히 초기화해야 합니다.
        destinationVC.detailpopupview.restaurantLabel.text = name
        
        // ViewController를 present 합니다.
        present(destinationVC, animated: true, completion: nil)
    }
    
}
