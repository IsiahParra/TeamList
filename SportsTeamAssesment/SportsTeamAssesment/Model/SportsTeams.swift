//
//  SportsTeamsModel.swift
//  SportsTeamAssesment
//
//  Created by Isiah Parra on 5/19/22.
//

import Foundation

class SportsTeam {
    var teamName: String
    var teamRanking: Int
    var teamCount: Int
    //MARK: Memberwise Initilizer
    init (teamName: String,teamRanking: Int, teamCount: Int) {
        self.teamName = teamName
        self.teamCount = teamCount
        self.teamRanking = teamRanking
    }
}//End of class
extension SportsTeam: Equatable {
    static func == (lhs: SportsTeam, rhs: SportsTeam) -> Bool {
        return lhs.teamCount == rhs.teamCount && lhs.teamRanking == rhs.teamRanking && lhs.teamName == rhs.teamName
    }
}




