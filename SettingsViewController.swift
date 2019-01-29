//
//  SettingsViewController.swift
//  easy tips
//
//
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    @IBOutlet weak var roundingControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let percentIndex = defaults.integer(forKey: "tip_percent")
        let roundingIndex = defaults.integer(forKey: "rounding")

        tipPercentControl.selectedSegmentIndex = percentIndex
        roundingControl.selectedSegmentIndex = roundingIndex
    }
    
    @IBAction func onDefaultPercentChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let index = tipPercentControl.selectedSegmentIndex

        defaults.set(index, forKey: "tip_percent")
        defaults.synchronize()
    }

    @IBAction func onRoundingChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let index = roundingControl.selectedSegmentIndex

        defaults.set(index, forKey: "rounding")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
