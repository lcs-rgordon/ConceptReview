//
//  ItemToMatch.swift
//  MatchingGame
//
//  Created by Russell Gordon on 2022-05-04.
//

import Foundation

struct ItemToMatch: Identifiable, Codable {
    
    // MARK: Stored properties
    let description: String
    let image: String
    var id: Int

}
