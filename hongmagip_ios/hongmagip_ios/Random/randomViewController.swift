//
//  randomViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import UIKit
import SnapKit

class randomViewController: UIViewController {
    //MARK: - UI ProPerties
    var initialView = randomView()

    //MARK: - Define Method
    override func viewDidLoad() {
        super.viewDidLoad()
        SetView()
        Constraint()
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
  

}
