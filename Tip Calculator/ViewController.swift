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
        
        let userDefaults = UserDefaults.standard
        
        let settingsSegSelected = userDefaults.integer(forKey: "settingsSegSelectedKey")
        let mainSegSelected = settingsSegSelected
        tipControl.selectedSegmentIndex = mainSegSelected
        onEditingChanged(sender: true as AnyObject)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(_ sender: Any) {
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }

    @IBAction func EditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        let userDefaults = UserDefaults.standard
        let mainSegSelected = userDefaults.integer(forKey: "mainSegSelectedKey")
        let settingsSegSelected = userDefaults.integer(forKey: "settingsSegSelectedKey")
       
        if (mainSegSelected != settingsSegSelected) {
            tipControl.selectedSegmentIndex = settingsSegSelected
            onEditingChanged(sender: true as AnyObject)
        }
        
        lightOn = userDefaults.bool(forKey: "lightDefaultKey")
        darkOn = userDefaults.bool(forKey: "darkDefaultKey")
        
        if (lightOn == true) {
            self.view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
            
            billField.textColor = UIColor.darkGray
            
            tipControl.backgroundColor = UIColor.white
            tipControl.tintColor = UIColor.darkGray
            
            plusLabel.textColor = UIColor.darkGray
            tipLabel.textColor = UIColor.darkGray
            
            equalsLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
        }
        else if (darkOn == true) {
            self.view.backgroundColor = UIColor.darkGray
            
            billField.textColor = UIColor.white
            
            tipControl.backgroundColor = UIColor.darkGray
            tipControl.tintColor = UIColor.white
            
            plusLabel.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            
            equalsLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let mainSegSelected = tipControl.selectedSegmentIndex
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(mainSegSelected, forKey: "mainSegSelectedKey")
        userDefaults.synchronize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

