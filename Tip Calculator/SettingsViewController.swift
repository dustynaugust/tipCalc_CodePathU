
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
        
        let userDefaults = UserDefaults.standard
        
        lightOn = userDefaults.bool(forKey: "lightDefaultKey")
        darkOn = userDefaults.bool(forKey: "darkDefaultKey")
        
        if (lightOn == true) {
            lightSwitch.isOn = true
            darkSwitch.isOn = false
            lightTheme()
        }
        else if (darkOn == true) {
            darkSwitch.isOn = true
            lightSwitch.isOn = false
            darkTheme()
        }
    }
    
    //
    // This is for the light button
    @IBAction func lightAction(sender: AnyObject) {
        lightSwitch.isOn = true
        darkSwitch.isOn = false
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "lightDefaultKey")
        userDefaults.set(false, forKey: "darkDefaultKey")
        
        lightTheme()
    }
    
    //
    // This controls how the lightTheme looks
    func lightTheme() {
        self.view.backgroundColor = lighterGrayColor
        
        segControl.backgroundColor = UIColor.white
        segControl.tintColor = UIColor.darkGray

        defTipLabel.textColor = UIColor.darkGray
        lightLabel.textColor = UIColor.darkGray
        darkLabel.textColor = UIColor.darkGray
        
        lightSwitch.tintColor = UIColor.darkGray
        darkSwitch.tintColor = UIColor.darkGray
        
        lightSwitch.onTintColor = UIColor.darkGray
        darkSwitch.onTintColor = UIColor.darkGray
        
        lightSwitch.thumbTintColor = UIColor.white
        darkSwitch.thumbTintColor = UIColor.lightGray
    }

    //
    // This is for the dark button
   @IBAction func darkAction(sender: AnyObject) {
        darkSwitch.isOn = true
        lightSwitch.isOn = false
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "darkDefaultKey")
        userDefaults.set(false, forKey: "lightDefaultKey")
        darkTheme()
    }

    //
    // This controls the dark theme's looks
    func darkTheme() {
        self.view.backgroundColor = UIColor.darkGray
        
        segControl.backgroundColor = UIColor.darkGray
        segControl.tintColor = UIColor.white
        
        defTipLabel.textColor = UIColor.white
        lightLabel.textColor = UIColor.white
        darkLabel.textColor = UIColor.white
        
        lightSwitch.tintColor = UIColor.white
        darkSwitch.tintColor = UIColor.white
        
        lightSwitch.onTintColor = UIColor.darkGray
        darkSwitch.onTintColor = UIColor.lightGray
        
        lightSwitch.thumbTintColor = UIColor.white
        darkSwitch.thumbTintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        let userDefaults = UserDefaults.standard
  
        segControl.selectedSegmentIndex = userDefaults.integer(forKey: "settingsSegSelectedKey")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingSegValueChange(sender: AnyObject) {
        settingsSegSelected = segControl.selectedSegmentIndex
        
        let userDefaults = UserDefaults.standard
        userDefaults.integer(forKey: "settingsSegSelectedKey")
        userDefaults.set(settingsSegSelected, forKey: "settingsSegSelectedKey")
        userDefaults.set(settingsSegSelected, forKey: "mainSegSelected")
        }
    @IBAction func settingsSwipeLeft(sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
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
