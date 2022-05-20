//
//  SportsTeamViewController.swift
//  SportsTeamAssesment
//
//  Created by Isiah Parra on 5/19/22.
//

import UIKit

class SportsTeamViewController: UIViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamNameTxtField: UITextField!
    @IBOutlet weak var teamRankingLabel: UILabel!
    @IBOutlet weak var teamRankingTextField: UITextField!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var playerCountTextField: UITextField!
    
    //MARK: Properties
    var sportsTeamReciever: SportsTeam?
    
    //MARK: Helper function
    func updateView(SportsTeam: SportsTeam?) {
        guard let SportsTeam = sportsTeamReciever else {return}
        teamNameTxtField.text = SportsTeam.teamName
        teamRankingTextField.text = "\(SportsTeam.teamRanking)"
        playerCountTextField.text = "\(SportsTeam.teamCount)"
    }
    
    func resetView() {
        teamNameTxtField.text = ""
        teamRankingTextField.text = ""
        playerCountTextField.text = ""
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(SportsTeam: sportsTeamReciever)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetView()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let sportsTeamReciever = sportsTeamReciever else {return}
        SportsTeamController.sharedInstance.deleteSportsTeam(teamToDelete: sportsTeamReciever)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let teamName = teamNameTxtField.text,
              let teamRank = teamRankingTextField.text,
              let teamCount = playerCountTextField.text else {return}
        if let sportsTeam = sportsTeamReciever {
            //if the receiver has a value they are updating
            SportsTeamController.sharedInstance.updateSportsTeam(newTeamName: teamName, newTeamRank: Int (teamRank) ?? 0, newPlayerCount: Int (teamCount) ?? 0, teamToUpdate: sportsTeam)
        } else {
            SportsTeamController.sharedInstance.createSportsTeam(teamName: teamName, teamRank: Int (teamRank) ?? 0, playerCount: Int (teamCount) ?? 0)
        }
        navigationController?.popViewController(animated: true)
    }
}// End Of class
