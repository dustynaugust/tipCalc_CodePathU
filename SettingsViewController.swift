
import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var defTipLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var darkLabel: UILabel!
    
    var lowTip: Double!
    var midTip: Double!
    var highTip: Double!
    var settingsSegSelected: Int!
    var lightOn: Bool!
    var darkOn: Bool!
    var lighterGrayColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
    //
    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var darkSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        lightOn = userDefaults.boolForKey("lightDefaultKey")
        darkOn = userDefaults.boolForKey("darkDefaultKey")
        
        if (lightOn == true) {
            lightSwitch.on = true
            darkSwitch.on = false
            lightTheme()
        }
        else if (darkOn == true) {
            darkSwitch.on = true
            lightSwitch.on = false
            darkTheme()
        }
    }
    
    //
    // This is for the light button
    @IBAction func lightAction(sender: AnyObject) {
        lightSwitch.on = true
        darkSwitch.on = false
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "lightDefaultKey")
        userDefaults.setBool(false, forKey: "darkDefaultKey")
        
        lightTheme()
    }
    
    //
    // This controls how the lightTheme looks
    func lightTheme() {
        self.view.backgroundColor = lighterGrayColor
        
        segControl.backgroundColor = UIColor.whiteColor()
        segControl.tintColor = UIColor.darkGrayColor()

        defTipLabel.textColor = UIColor.darkGrayColor()
        lightLabel.textColor = UIColor.darkGrayColor()
        darkLabel.textColor = UIColor.darkGrayColor()
        
        lightSwitch.tintColor = UIColor.darkGrayColor()
        darkSwitch.tintColor = UIColor.darkGrayColor()
        
        lightSwitch.onTintColor = UIColor.darkGrayColor()
        darkSwitch.onTintColor = UIColor.darkGrayColor()
        
        lightSwitch.thumbTintColor = UIColor.whiteColor()
        darkSwitch.thumbTintColor = UIColor.lightGrayColor()
    }

    //
    // This is for the dark button
   @IBAction func darkAction(sender: AnyObject) {
        darkSwitch.on = true
        lightSwitch.on = false
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "darkDefaultKey")
        userDefaults.setBool(false, forKey: "lightDefaultKey")
        darkTheme()
    }

    //
    // This controls the dark theme's looks
    func darkTheme() {
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        segControl.backgroundColor = UIColor.darkGrayColor()
        segControl.tintColor = UIColor.whiteColor()
        
        defTipLabel.textColor = UIColor.whiteColor()
        lightLabel.textColor = UIColor.whiteColor()
        darkLabel.textColor = UIColor.whiteColor()
        
        lightSwitch.tintColor = UIColor.whiteColor()
        darkSwitch.tintColor = UIColor.whiteColor()
        
        lightSwitch.onTintColor = UIColor.darkGrayColor()
        darkSwitch.onTintColor = UIColor.lightGrayColor()
        
        lightSwitch.thumbTintColor = UIColor.whiteColor()
        darkSwitch.thumbTintColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        let userDefaults = NSUserDefaults.standardUserDefaults()
  
        segControl.selectedSegmentIndex = userDefaults.integerForKey("settingsSegSelectedKey")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingSegValueChange(sender: AnyObject) {
        settingsSegSelected = segControl.selectedSegmentIndex
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.integerForKey("settingsSegSelectedKey")
        userDefaults.setInteger(settingsSegSelected, forKey: "settingsSegSelectedKey")
        userDefaults.setInteger(settingsSegSelected, forKey: "mainSegSelected")
        }
    @IBAction func settingsSwipeLeft(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
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
