//
//  ReservationListViewController.swift
//  MeetingRoomsDynamic
//
//  Created by Hakyung Noa on 05/11/2017.
//  Copyright © 2017 Hakyung Noah. All rights reserved.
//

import UIKit

class ReservationListViewController: UITableViewController {
    
    var meetingRoom:MeetingRoom?
    var newReservation:Reservation?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addNewItem(_ reservation:Reservation) {
        if (self.meetingRoom?.reservations?.append(reservation)) == nil {
            self.meetingRoom?.reservations = [reservation]
        }
        dataCenter.save()
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func unwindToReserveList(_ segue:UIStoryboardSegue) {
        print("unwind")
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = meetingRoom?.reservations?.count else {
            return 0
        }
        return rowCount
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath)

        guard let reservation = meetingRoom?.reservations?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = reservation.date.description
        cell.detailTextLabel?.text = reservation.hostName
        return cell
        
    }


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
