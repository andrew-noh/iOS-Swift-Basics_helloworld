//
//  TintColorViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Hakyung Noa on 05/11/2017.
//  Copyright © 2017 Hakyung Noah. All rights reserved.
//

import UIKit

enum TintColor:Int {
    case blue=0, red, green, purple
    
    var color:UIColor {get{
        switch self {
        case .blue:
            return UIColor.blue
        case .red:
            return UIColor.red
        case .green:
            return UIColor.green
        case .purple:
            return UIColor.purple
        }
        }}
}
let TintColorKey = "TintColor"


func applyTintColor(_ color:UIColor){
    guard let window = UIApplication.shared.keyWindow else {
        return
    }
    window.tintColor = color
}


class TintColorViewController: UIViewController {

    @IBOutlet var tintColorSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userDefaultColor = UserDefaults.standard.integer(forKey: TintColorKey)
        
        self.tintColorSegment.selectedSegmentIndex = userDefaultColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tintColorChanged(_ sender: Any) {
        let selectedIndex = self.tintColorSegment.selectedSegmentIndex
        UserDefaults.standard.set(selectedIndex, forKey: TintColorKey)
        guard let changedColor = TintColor(rawValue: selectedIndex)?.color else {
            return
        }
        applyTintColor(changedColor)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
