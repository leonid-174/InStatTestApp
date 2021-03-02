//
//  inStatModel.swift
//  inStatTestApp
//
//  Created by Leonid Vilner on 25/02/2021.
//  Copyright © 2021 Andrey Vilner. All rights reserved.
//

import Foundation

class InStatModel {
    
    public struct inStatResponse: Codable {
        var tournament:inStatTournament
        var date: String?
        var team1:inStatTeam1
        var team2:inStatTeam2
        var stream_status:Int?
    }
    
    public struct inStatTeam1: Codable {
        var id: Int?
        var name_eng: String?
        var name_rus: String?
        var score: Int?
    }
    
    public struct inStatTeam2: Codable {
        var id: Int?
        var name_eng: String?
        var name_rus: String?
        var score: Int?
    }
    
    public struct inStatTournament: Codable {
        var id: Int?
        var name_eng: String?
        var name_rus: String?
    }
    
    
    public struct inStatLinkResponse: Codable {
        var name: String?
        var match_id: Int?
        var period: Int?
        var server_id: Int?
        var quality: String?
        var folder: String?
        var video_type: String?
        var abc: String?
        var start_ms: Int?
        var checksum: Int?
        var size: Int?
        var abc_type: String?
        var duration: Int?
        var fps: Int?
        var url_root: String?
        var url: String?
    }
    
    public struct linkArray: Codable {
        var name: String?
        var quality: String?
        var url: String?
    }
    
}
