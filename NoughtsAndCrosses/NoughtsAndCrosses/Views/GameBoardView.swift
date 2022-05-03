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
    
    // Game board state (all nine positions)
    // Top row
    @State var upperLeft = empty
    @State var upperMiddle = empty
    @State var upperRight = empty
    // Middle row
    @State var middleLeft = empty
    @State var middleMiddle = empty
    @State var middleRight = empty
    // Bottom row
    @State var bottomLeft = empty
    @State var bottomMiddle = empty
    @State var bottomRight = empty
    
    // Tracks whose turn it is
    @State var currentPlayer = nought
    
    // Tracks what turn it is (nine total are possible)
    @State var currentTurn = 1
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Current turn is: \(currentTurn)")
            
            Spacer()
            
            // Top row
            HStack {
                // Send connection to properties on this view
                // to the helper view using a binding
                TileView(state: $upperLeft,
                         player: currentPlayer,
                         turn: $currentTurn)
                TileView(state: $upperMiddle,
                         player: currentPlayer,
                         turn: $currentTurn)
                TileView(state: $upperRight,
                         player: currentPlayer,
                         turn: $currentTurn)
            }

            // Middle row
            HStack {
                TileView(state: $middleLeft,
                         player: currentPlayer,
                         turn: $currentTurn)
                TileView(state: $middleMiddle,
                         player: currentPlayer,
                         turn: $currentTurn)
                TileView(state: $middleRight,
                         player: currentPlayer,
                         turn: $currentTurn)
            }

            // Bottom row
            HStack {
                TileView(state: $bottomLeft,
                         player: currentPlayer,
                         turn: $currentTurn)
                TileView(state: $bottomMiddle,
                         player: currentPlayer,
                         turn: $currentTurn)
                TileView(state: $bottomRight,
                         player: currentPlayer,
                         turn: $currentTurn)
            }
            
            Spacer()
            
            Text("Current player is: \(currentPlayer)")
            
            Spacer()
            
        }
        .onChange(of: currentTurn) { newValue in
            
            print("It's now turn \(newValue)...")
            
            // Change the current player
            if currentPlayer == nought {
                currentPlayer = cross
            } else {
                currentPlayer = nought
            }
            
        }
        
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
