//
//  CalculatorController.swift
//  Basic Calculator
//
//  Created by Nijat Muzaffarli on 03/03/2017.
//  Copyright © 2017 Nijat Muzaffarli. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var prgsLabel: UILabel!
    
    
    enum Operation: String
    {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        case Percent = "%"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var showingnumber = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        outputLbl.text = "0"
        
    }
    
    
    @IBAction func minusPressed(_ sender: UIButton)
    {
        let firschar = runningNumber.characters.first
        
        if(firschar != "-")
        {
            runningNumber.insert("-", at: runningNumber.startIndex)
            showingnumber.insert("-", at: showingnumber.startIndex)
            prgsLabel.text = showingnumber
        }else{
            runningNumber.characters.removeFirst()
            showingnumber.characters.removeFirst()
            prgsLabel.text = showingnumber
        }
    }
    
    
    @IBAction func dotPressed(_ sender: UIButton)
    {
        runningNumber += (".")
        showingnumber += "."
        prgsLabel.text = showingnumber
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        
        runningNumber += "\(sender.tag)"
        showingnumber += "\(sender.tag)"
        prgsLabel.text = showingnumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(operation: .Divide)
        showingnumber += "/"
        prgsLabel.text = showingnumber
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(operation: .Multiply)
        showingnumber += "*"
        prgsLabel.text = showingnumber
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(operation: .Subtract)
        showingnumber += "-"
        prgsLabel.text = showingnumber
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .Add)
        showingnumber += "+"
        prgsLabel.text = showingnumber
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
    @IBAction func onPercentPressed(sender: AnyObject) {
        processOperation(operation: .Percent)
        showingnumber += "%"
        prgsLabel.text = showingnumber
        
    }
    
    @IBAction func cleanall(sender: UIButton)
    {
        runningNumber = ""
        outputLbl.text = ""
        result = ""
        currentOperation = Operation.Empty
        leftValStr = ""
        rightValStr = ""
        prgsLabel.text = ""
        showingnumber = ""
    }
    
    func processOperation(operation: Operation)
    {
        if currentOperation != Operation.Empty
        {
            if runningNumber != ""
            {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Percent {
                    result = "\(Double(leftValStr)! / (Double(100)) * Double(rightValStr)!)"
                }
                leftValStr = result
                let cleanresult = result.cleaner
                outputLbl.text = cleanresult
                
            }
            currentOperation = operation
        }
        else
        {
            //ilk defe operator basilanda
            leftValStr = runningNumber
            showingnumber = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
    
    
}
