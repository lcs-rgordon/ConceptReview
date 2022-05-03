//
//  GameBoardView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//

import SwiftUI

/// - Tag: game_board
struct GameBoardView: View {
    
    // MARK: Stored properties
    
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Top row
            HStack {
                TileView(state: nought)
                TileView(state: cross)
                TileView(state: nought)
            }

            // Middle row
            HStack {
                TileView(state: empty)
                TileView(state: cross)
                TileView(state: cross)
            }

            // Bottom row
            HStack {
                TileView(state: empty)
                TileView(state: empty)
                TileView(state: nought)
            }
            
        }
        
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
