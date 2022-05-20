//
//  SportsTeamTableViewCell.swift
//  SportsTeamAssesment
//
//  Created by Isiah Parra on 5/19/22.
//

import UIKit

class SportsTeamTableViewCell: UITableViewCell {
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    
    @IBOutlet weak var teamRankingLabel: UILabel!
    
    
    func updateView(sportsTeams: SportsTeam) {
        teamNameLabel.text = sportsTeams.teamName
        teamRankingLabel.text = "\(sportsTeams.teamRanking)"
        playerCountLabel.text = "\(sportsTeams.teamCount)"
    }
}// end of class
