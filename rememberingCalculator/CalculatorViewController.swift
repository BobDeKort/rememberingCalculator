//
//  ViewController.swift
//  rememberingCalculator
//
//  Created by Bob De Kort on 11/16/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // Variables
    var isTypingNumber: Bool = false
    var isFinished: Bool = false
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var selectedOperator: String = ""
    
    var calculationArray: [String] = []
    
    // General IBOutlets
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var computedResultsLabel: UILabel!
    
    // Keypad 
    
    @IBAction func numberTapped(_ sender: UIButton) {
        let number = sender.titleLabel!.text
        
        if number! == "C"{
            clear()
        } else {
            if isFinished == true{
                clear()
                isFinished = false
            }
            if isTypingNumber == true{
                displayLabel.text = (displayLabel.text! + number!)
            } else {
                displayLabel.text = number!
                isTypingNumber = true
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        let tempOperator = sender.titleLabel!.text
        
        let tempString = displayLabel.text
        let tempInt = Int(tempString!)
        
        if tempOperator! == "="{
            secondNumber = tempInt!
            let result = calculate(a: firstNumber, b: secondNumber, oper: selectedOperator)
            displayLabel.text = String(result)
            saveCalculation(a: firstNumber, b: secondNumber, oper: selectedOperator, result: result)
            isFinished = true
        } else {
            displayLabel.text = ""
        }
        
        switch tempOperator! {
        case "+":
            firstNumber = tempInt!
            selectedOperator = tempOperator!
            break
        case "-":
            firstNumber = tempInt!
            selectedOperator = tempOperator!
            break
        case "=":
            secondNumber = tempInt!
            break
        default:
            print("no operator")
        }
        
    }
    
    
    // Menu actions
    @IBAction func previousResultsButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResults"{
            let destinationVC = segue.destination as! ResultsTableViewController
            destinationVC.calcualtionsArray = calculationArray
        }
    }


    // Functions
    
    func clear(){
        displayLabel.text = ""
        firstNumber = 0
        secondNumber = 0
        selectedOperator = ""
        isTypingNumber = false
    }
    
    func calculate(a: Int, b: Int, oper: String) -> Int{
        switch oper{
            case "+":
                let result = a+b
                return result
            case "-":
                let result = a-b
                return result
            default:
                print("no operator selected")
                break
        }
        return 0
    }
    
    func saveCalculation(a: Int, b: Int, oper: String, result: Int){
        let calculation: String = (String(a) + " " + oper + " " + String(b) + " = " + String(result))
        print(calculation)
        calculationArray.append(calculation)
    }
}

