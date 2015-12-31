import UIKit

class ViewController: UIViewController {
    
    var lowTip: Double!
    var midTip: Double!
    var highTip: Double!
    var settingsSegSelected: Int!
    var previousSegSelected: Int!
    var mainSegSelected: Int!
    var lightOn: Bool!
    var darkOn: Bool!

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel:
        UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel:
        UILabel!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.becomeFirstResponder()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let settingsSegSelected = userDefaults.integerForKey("settingsSegSelectedKey")
        let mainSegSelected = settingsSegSelected
        tipControl.selectedSegmentIndex = mainSegSelected
        onEditingChanged(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let mainSegSelected = userDefaults.integerForKey("mainSegSelectedKey")
        let settingsSegSelected = userDefaults.integerForKey("settingsSegSelectedKey")
       
        if (mainSegSelected != settingsSegSelected) {
            tipControl.selectedSegmentIndex = settingsSegSelected
            onEditingChanged(true)
        }
        
        lightOn = userDefaults.boolForKey("lightDefaultKey")
        darkOn = userDefaults.boolForKey("darkDefaultKey")
        
        if (lightOn == true) {
            self.view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
            
            billField.textColor = UIColor.darkGrayColor()
            
            tipControl.backgroundColor = UIColor.whiteColor()
            tipControl.tintColor = UIColor.darkGrayColor()
            
            plusLabel.textColor = UIColor.darkGrayColor()
            tipLabel.textColor = UIColor.darkGrayColor()
            
            equalsLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
        }
        else if (darkOn == true) {
            self.view.backgroundColor = UIColor.darkGrayColor()
            
            billField.textColor = UIColor.whiteColor()
            
            tipControl.backgroundColor = UIColor.darkGrayColor()
            tipControl.tintColor = UIColor.whiteColor()
            
            plusLabel.textColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            
            equalsLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let mainSegSelected = tipControl.selectedSegmentIndex
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(mainSegSelected, forKey: "mainSegSelectedKey")
        userDefaults.synchronize()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

