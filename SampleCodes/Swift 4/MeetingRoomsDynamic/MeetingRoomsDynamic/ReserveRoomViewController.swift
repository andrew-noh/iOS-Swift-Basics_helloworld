//
//  ReserveRoomViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Hakyung Noa on 05/11/2017.
//  Copyright © 2017 Hakyung Noah. All rights reserved.
//

import UIKit

class ReserveRoomViewController: UITableViewController {

    @IBOutlet var hostNameField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var attendeesField: UITextField!
    @IBOutlet var equipmentsField: UITextField!
    @IBOutlet var cateringSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func makeReservation(_ sender: Any) {
        guard let reservation = makeReservation() else {
            self.dismiss(animated: true, completion: {
            })
            return
        }
        
        switch self.presentingViewController {
        case let tabBarC as UITabBarController:
            if let navigationC = tabBarC.selectedViewController as? UINavigationController, let reservationListVC = navigationC.topViewController as? ReservationListViewController {
                reservationListVC.addNewItem(reservation)
            }
        case let navigationC as UINavigationController:
            if let reservationListVC = navigationC.topViewController as? ReservationListViewController {
                reservationListVC.addNewItem(reservation)
            }
        case let reservationListVC as ReservationListViewController:
            reservationListVC.addNewItem(reservation)
        default:
            print("Cannot find ReservationListViewController")
            break
        }
        
        self.dismiss(animated: true, completion: {
        })
    }
    
    
    @IBAction func cancelReservation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReserveDone" {
            guard let newReservation = makeReservation(), let reservationListVC = segue.destination as? ReservationListViewController else {
                return
            }
            reservationListVC.addNewItem(newReservation)
        }
    }
    
    func makeReservation() -> Reservation? {
        let newReservation = Reservation()
        let host = hostNameField.text!
        if host.isEmpty {
            return nil
        }
        newReservation.hostName = host
        newReservation.date = datePicker.date
        if let equipmentArray = equipmentsField.text?.characters.split(separator: ",").map(String.init) {
            newReservation.equipments = equipmentArray
        }
        newReservation.catering = cateringSwitch.isOn
        return newReservation
    }
    
    // MARK: - Table view data source
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     */
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
