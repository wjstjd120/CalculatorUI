//
//  ButtonView.swift
//  SnapKitProject
//
//  Created by 전성진 on 6/21/24.
//

import Foundation
import UIKit

struct ButtonProperty {
    let titleLabel: String
    let fontStyle: UIFont.Weight
    let fontSize: Int
    let titleColor: UIColor
    let color: UIColor
    
    init(_ titleLabel: String, _ fontStyle: UIFont.Weight, _ fontSize: Int, _ titleColor: UIColor, _ color: UIColor) {
        self.titleLabel = titleLabel
        self.fontStyle = fontStyle
        self.fontSize = fontSize
        self.titleColor = titleColor
        self.color = color
    }
    
    func buttonMake() -> UIButton {
        let button = UIButton()
        button.setTitle(titleLabel, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: fontStyle)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = color
        button.snp.makeConstraints {
            $0.width.height.equalTo(75)
        }
        button.layer.cornerRadius = 75 / 2
        return button
    }
    
    static let buttonList: [[UIButton]] = [
        [ButtonProperty("7", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("8", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("9", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("+", .bold, 25, .white, .orange).buttonMake()],
        
        [ButtonProperty("4", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("5", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("6", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("-", .bold, 25, .white, .orange).buttonMake()],
        
        [ButtonProperty("1", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("2", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("3", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
         ButtonProperty("*", .bold, 25, .white, .orange).buttonMake()],
        
        [ButtonProperty("AC", .bold, 25, .white, .orange).buttonMake(),
        ButtonProperty("0", .bold, 25, .white, UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)).buttonMake(),
        ButtonProperty("=", .bold, 25, .white, .orange).buttonMake(),
         ButtonProperty("/", .bold, 25, .white, .orange).buttonMake()]

    ]
}
