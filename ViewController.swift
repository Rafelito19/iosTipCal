//
//  ViewController.swift
//  Easy tipps
//
//  
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePeopleLabel: UILabel!
    @IBOutlet weak var fourPeopleLabel: UILabel!

    var roundingSetting = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let percentSetting = defaults.integer(forKey: "tip_percent")

        tipControl.selectedSegmentIndex = percentSetting
        self.roundingSetting = defaults.integer(forKey: "rounding")

        self.onEditingChanged(self)
    }
    
    
    //Calculate tip when entry box is tap
    @IBAction func onEditingChanged(_ sender: AnyObject) {
        var billAmount = NSString(string: billField.text!).doubleValue
        let tipPercentages = [0.15, 0.18, 0.20]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        

        var tip = billAmount * tipPercent
        var total = billAmount + tip

        if (self.roundingSetting == 1) {
            tip = round(tip)
            total = billAmount + tip
        } else if (self.roundingSetting == 2) {
            total = round(total)
            tip = total - billAmount
        }

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
}

