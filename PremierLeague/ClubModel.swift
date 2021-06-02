//
//  ClubModel.swift
//  PremierLeague
//
//  Created by Syaiful Salam on 02/06/21.
//

import Foundation


struct ClubModel: Codable, Identifiable {
    
    enum CodingKeys: CodingKey{
        case name, nickname, emblem, description, stadiumBg, stadiumName
        case formed
    }
    
    var id = UUID()
    var name, nickname, emblem, description, stadiumBg, stadiumName: String
    var formed: Int
    
}
