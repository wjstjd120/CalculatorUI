//
//  StackView.swift
//  SnapKitProject
//
//  Created by 전성진 on 6/22/24.
//

import Foundation
import UIKit

struct StackViewProperty {
    func hStackViewMake() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }
    
    func vStackViewMake() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }
    
    static let hStackViewList: [UIStackView] = [
        StackViewProperty().hStackViewMake(),
        StackViewProperty().hStackViewMake(),
        StackViewProperty().hStackViewMake(),
        StackViewProperty().hStackViewMake()
    ]
    
    static let vStackViewList: [UIStackView] = [
        StackViewProperty().vStackViewMake()
    ]
}


