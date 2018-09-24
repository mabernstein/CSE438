//
//  ViewController.swift
//  MaxBernstein-Lab1
//
//  Created by Max Bernstein on 9/9/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputPriceView: UITextField!
    @IBOutlet weak var discountView: UITextField!
    @IBOutlet weak var taxView: UITextField!
    @IBOutlet weak var displayPrice: UILabel!
    
    private var finalPrice : Double = 0
    
    //Calculate Final Price
    @IBAction func updateFinalPrice(_ sender: Any) {
        let inputPrice = (inputPriceView.text! as NSString).doubleValue
        let discount = (discountView.text! as NSString).doubleValue
        let tax = (taxView.text! as NSString).doubleValue
        
        finalPrice = inputPrice-(inputPrice*(discount/100))
        finalPrice += (finalPrice*(tax/100))
        print(finalPrice)
        updateDisplay()
    }
    
    //Update View
    func updateDisplay(){
        let displayText = "\(currencyLabel)\(String(format: "%.2f", finalPrice))"
        displayPrice.text = displayText
        originalPriceLabel.text = currencyLabel
        
        print(currencyConvRate)
    }
    

//Implement Currecy Switcher
    @IBOutlet weak var currency: UISegmentedControl!
    @IBOutlet weak var originalPriceLabel: UILabel!
    var currencyLabel = "$"
    var currencyConvRate : Double = 1
    
    @IBAction func currencyPick(_ sender: Any) {
        if currency.selectedSegmentIndex == 0 {
            currencyLabel = "$"
            currencyConvRate = 1/0.86
        }
        if currency.selectedSegmentIndex == 1 {
            currencyLabel = "€"
            currencyConvRate = 0.86
        }
        finalPrice = currencyConvRate * finalPrice
        updateDisplay()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputPriceView.resignFirstResponder()
        discountView.resignFirstResponder()
        taxView.resignFirstResponder()
    }
}

//implement simulator keyboard
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        displayPrice.resignFirstResponder()
        return true
    }
}




