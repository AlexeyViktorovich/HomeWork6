//
//  ViewController.swift
//  HomeWork6
//
//  Created by Алексей Полин on 06.07.2021.
//

import UIKit

class ViewController: UIViewController {
    //1 Задание
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var printStringL: UILabel!
    @IBAction func changeStringLabelB(_ sender: Any) {
        printStringL.text! += nameTF.text! + " "
        nameTF.text = nil
    }
    //2 Задание
    
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var calcL: UILabel!
    @IBAction func degreeB(_ sender: Any) {
        if let number = Int(numberTF.text ?? ""){
            if number < 63{
                var result = 1
                for _ in 0..<number{
                    result *= 2
                }
                calcL.text = String("2 in \(number) degree =  \(result)")
                numberTF.text = nil
            } else {
                calcL.text = "max number for enter -> 62 otherwise the number will exceed the maximum allowable value"
                numberTF.text = nil
            }
        } else if numberTF.text == "" {
            calcL.text = "you have not entered anything"
        } else {
            calcL.text = "enter number! \"\(numberTF.text ?? "")\" is not number!"
            
            numberTF.text = nil
        }
    }
    @IBOutlet weak var firstNumberTF: UITextField!
    @IBOutlet weak var secondNumberTF: UITextField!
    @IBOutlet weak var signTF: UITextField!
    @IBOutlet weak var resultL: UILabel!
    @IBAction func actionB(_ sender: Any) {
        guard let unwrappedStringOne = firstNumberTF.text,
              let unwrappedStringTwo = secondNumberTF.text,
              let signString = signTF.text else {return}
        
        if let firstNumber = Double(unwrappedStringOne),
           let secondNumber = Double(unwrappedStringTwo),
           let sign = Sign(rawValue: signString){
            let results = sign.calc(firstNumber,secondNumber)
            resultL.text = "\(firstNumberTF.text ?? "") \(signTF.text ?? "") \(secondNumberTF.text ?? "") = " + String(results)
        }
        enum Sign: String{
            case summ = "+", subtraction = "-", multiplication = "*", division = "/", power = "^", residue = "%"
            
            func calc(_ a: Double, _ b: Double) -> String {
                var c: Double = 0
                let error = "Деление на \"0\" запрещено!"
                
                switch self {
                case .summ:
                    c = a + b
                case .subtraction:
                    c = a - b
                case .multiplication:
                    c = a * b
                case .division:
                    if b != 0 { c = a / b } else {return error}
                case .power:
                    c = pow(a, b)
                case .residue:
                    c = a.truncatingRemainder(dividingBy: b)
                }
                return String(c)
                
            }
        }
        firstNumberTF.text = nil
        signTF.text = nil
        secondNumberTF.text = nil
    }
}

