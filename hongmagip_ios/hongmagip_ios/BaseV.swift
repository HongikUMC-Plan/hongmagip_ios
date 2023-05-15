//
//  CollectionV.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/15.
//

import UIKit
import SnapKit

class BaseV: UIView {
    //MARK: - UI ProPerties
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetView()
        Constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Define Method
    func SetView() {
        
    }
    
    func Constraint() {
        
    }
    
    
    //MARK: - Set Ui
    
}
