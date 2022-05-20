//
//  SportsTeamTableViewController.swift
//  SportsTeamAssesment
//
//  Created by Isiah Parra on 5/19/22.
//

import UIKit

class SportsTeamTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SportsTeamController.sharedInstance.sportsteams.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sportsTeamCell", for: indexPath) as? SportsTeamTableViewCell else {return UITableViewCell()}
        let sportsteam = SportsTeamController.sharedInstance.sportsteams
        let sportsTeamToDisplay = sportsteam[indexPath.row]
        cell.updateView(sportsTeams: sportsTeamToDisplay)
        // Configure the cell...
        
        return cell
    }
    // deleting cell function
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let deleteTeam = SportsTeamController.sharedInstance.sportsteams[indexPath.row]
            SportsTeamController.sharedInstance.deleteSportsTeam(teamToDelete: deleteTeam)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    //MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //MARK: IIDOO
        //Identifier
        if segue.identifier == "toDetailVC" {
            //Index
            if let index = tableView.indexPathForSelectedRow {
                //Destination
                if let destination = segue.destination as? SportsTeamViewController {
                    //Object to send
                    let sportsTeam = SportsTeamController.sharedInstance.sportsteams[index.row]
                    //Object to recieve
                    destination.sportsTeamReciever = sportsTeam
                }
            }
        }
        
    }
}//End Of class
