//
//  ViewController.swift
//  TIp APP
//
//  Created by User on 1/27/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indexor: UISegmentedControl!
    @IBOutlet weak var total_label: UILabel!
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var input_label: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func OnTapList(_ sender: Any) {
    
    print("hello")
        
        view.endEditing(true);
        
    }
    
 
    @IBAction func CalculateTip(_ sender: Any) {
        
        let tip_arr = [0.1, 0.18, 0.2]
        let bill=Double(input_label.text!) ?? 0
        let tip = bill * tip_arr[indexor.selectedSegmentIndex]
        let total = bill + tip
        
        tip_label.text =  String(format: "$.%2f", tip)
        total_label.text =  String(format: "$.%2f", total)
    }
}

