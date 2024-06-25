//
//  ViewController.swift
//  SnapKitProject
//
//  Created by 전성진 on 6/19/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: CGFloat(60), weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        let buttonList: [[UIButton]] = ButtonProperty.buttonList
        let hStackViewList: [UIStackView] = StackViewProperty.hStackViewList
        
        let vStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.backgroundColor = .clear
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            
            return stackView
        }()
        
        view.addSubview(numberLabel)
        view.addSubview(vStackView)
        
        vStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(120)
            $0.width.height.equalTo(330)
        }
        
        numberLabel.snp.makeConstraints {
            $0.left.equalTo(vStackView.snp.left).offset(20)
            $0.right.equalTo(vStackView.snp.right).offset(-20)
            $0.bottom.equalTo(vStackView.snp.top).offset(-20)
        }
        
        for (index, stackView) in hStackViewList.enumerated() {
            for button in buttonList[index] {
                stackView.addArrangedSubview(button)
                
                if let title = button.title(for: .normal) {
                    if "1234567890".contains(title) {
                        button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchDown)
                    } else if "+-*/".contains(title) {
                        button.addTarget(self, action: #selector(operButtonTapped(_:)), for: .touchDown)
                    } else if title == "AC" {
                        button.addTarget(self, action: #selector(ACButtonTapped(_:)), for: .touchDown)
                    } else if title == "=" {
                        button.addTarget(self, action: #selector(equalButtonTapped(_:)), for: .touchDown)
                    }
                }
                
                button.snp.makeConstraints {
                    $0.top.bottom.equalToSuperview()
                }
            }
        }
        
        hStackViewList.forEach {
            vStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.height.equalTo(vStackView.bounds.height / 4)
            }
        }
    }
    
    @objc
    func numberButtonTapped(_ sender: UIButton) {
        if let num = sender.title(for: .normal), let labelTitle = numberLabel.text {
            if labelTitle == "0" {
                numberLabel.text = num
            } else {
                numberLabel.text = labelTitle + num
            }
        }
    }
    
    @objc
    func operButtonTapped(_ sender: UIButton) {
        if let num = sender.title(for: .normal), let labelTitle = numberLabel.text {
            if labelTitle == "0" {
                numberLabel.text = "0"
            } else if labelTitle != "0" && "+-*/".contains(labelTitle.last!) {
                var str: String = labelTitle
                str.removeLast()
                numberLabel.text = str + num
            } else {
                numberLabel.text = labelTitle + num
            }
        }
    }
    
    @objc
    func ACButtonTapped(_ sender: UIButton) {
        numberLabel.text = "0"
    }
    
    @objc
    func equalButtonTapped(_ sender: UIButton) {
        guard var math = numberLabel.text else { return }
        
        if "+-*/".contains(math.last!) {
            math.removeLast()
            if let result = calculate(math) {
                numberLabel.text = "\(result)"
            }
        } else {
            if let result = calculate(math) {
                numberLabel.text = "\(result)"
            }
        }
    }
    
    func calculate(_ expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }

}

