//
//  ViewController.swift
//  UIKitProject
//
//  Created by 전성진 on 6/24/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var operButton: [UIButton]!
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButtonTap(_ sender: Any) {
        // 성공적으로 캐스팅되었을 때 실행되는 코드
        if let button = sender as? UIButton {
            if let num = button.title(for: .normal), let labelTitle = numberLabel.text {
                if labelTitle == "0" {
                    numberLabel.text = num
                } else {
                    numberLabel.text = labelTitle + num
                }
            } else {
                print("Button title is nil")
            }
        }
    }
    
    @IBAction func operButtonTap(_ sender: Any) {
        if let button = sender as? UIButton {
            if let oper = button.title(for: .normal), let labelTitle = numberLabel.text {
                if labelTitle == "0" {
                    numberLabel.text = "0"
                } else if labelTitle != "0" && "+-*/".contains(labelTitle.last!) {
                    var str: String = labelTitle
                    str.removeLast()
                    numberLabel.text = str + oper
                } else {
                    numberLabel.text = labelTitle + oper
                }
            }
        }
    }
    
    @IBAction func ACButtonTap(_ sender: Any) {
        numberLabel.text = "0"
    }
    
    @IBAction func equalButtonTap(_ sender: Any) {
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

