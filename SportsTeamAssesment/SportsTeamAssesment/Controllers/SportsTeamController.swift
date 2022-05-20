//
//  SportsTeamController.swift
//  SportsTeamAssesment
//
//  Created by Isiah Parra on 5/19/22.
//

import Foundation
//this is our model Controller
class SportsTeamController {
    //This will communicate to the Views
    //This file is resposible for the creation, updating, deletion and storing our model objects
    
    //MARK: Singleton
    static let sharedInstance = SportsTeamController()
    
    //MARK: Source of Truth
    var sportsteams: [SportsTeam] = []
    
    //MARK: CRUD
    func createSportsTeam(teamName: String, teamRank: Int, playerCount: Int) {
        let newTeam = SportsTeam(teamName: teamName, teamRanking: teamRank, teamCount: playerCount)
        sportsteams.append(newTeam)
        
    }
    func updateSportsTeam(newTeamName: String, newTeamRank: Int, newPlayerCount: Int, teamToUpdate: SportsTeam) {
        teamToUpdate.teamName = newTeamName
        teamToUpdate.teamRanking = newTeamRank
        teamToUpdate.teamCount = newPlayerCount
        
    }
    func deleteSportsTeam(teamToDelete: SportsTeam) {
        guard let indexOfSportsTeam = sportsteams.firstIndex(of: teamToDelete) else {return}
        sportsteams.remove(at: indexOfSportsTeam)
    }
}//End Of Class
