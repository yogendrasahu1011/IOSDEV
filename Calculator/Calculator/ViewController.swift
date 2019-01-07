//
//  ViewController.swift
//  Calculator
//
//  Created by yogendra  on 9/9/18.
//  Copyright © 2018 yogendra . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performMath = false;
    var tempNumberOnScreen:Double = 0; //to hold the value of Y from the equation( X operator Y)
    var operation = 0;
    var count = 0;
    var count2 = 0;
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {   if count != 0 //reset the label to avoid over writing the new input over the previous answers
            {
                label.text = "";
                count = 0;
            }
        if performMath == true // for taking the second value once an operator has been pressed on the screen this flag is set as true
        {   if  label.text == "-"
            {
            label.text =  label.text! + String(sender.tag-1);
            numberOnScreen = Double(label.text!)!;
            tempNumberOnScreen = Double(label.text!)!;
            performMath = false;
            }
            else
            {
            label.text = String(sender.tag-1);
            numberOnScreen = Double(label.text!)!;
            tempNumberOnScreen = Double(label.text!)!;
            performMath = false;
            }
        }
        else // for taking the first value
        {
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        tempNumberOnScreen = Double(label.text!)!;
        }
    }
    
   
    @IBAction func PreOpp(_ sender: Any)
    {
        label.text = "";
            label.text = "-";
        
    }
    
    
    
    @IBAction func Buttons(_ sender: UIButton)
    {
    
        if label.text != nil && sender.tag != 11 && sender.tag != 16 && sender.tag != 17
        {   if label.text != "+" && label.text != "-" && label.text != "/" && label.text != "-"
            {
                previousNumber = Double(label.text!)!;
                
            }
            if sender.tag == 12//divide
            {
                label.text = "/";
            }
            else if sender.tag == 13//multiply
            {
                label.text = "X";
            }
            else if sender.tag == 14//subtract
            {
                label.text = "-";
            }
            else if sender.tag == 15//add
            {
                label.text = "+";
            }
            operation = sender.tag
            performMath = true;
        }
        else if sender.tag == 16 && numberOnScreen != 0
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen);
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen);
            }
            else if operation == 14
            {
               label.text = String(previousNumber - numberOnScreen);
            }
            else if operation == 15
            {
               label.text = String(previousNumber + numberOnScreen);
            }
            numberOnScreen = tempNumberOnScreen;
            previousNumber = Double(label.text!)!;
            count = count + 1;
        }
        else if sender.tag == 17 && operation == 12
        {
            label.text = String((previousNumber / numberOnScreen)*100);
            count = count + 1;
        }
        else if sender.tag == 11
        {
            label.text = "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

