//
//  MatchPresentationView.swift
//  MatchingGame
//
//  Created by Russell Gordon on 2022-05-04.
//

import SwiftUI

struct MatchPresentationView: View {
    
    // MARK: Stored properties
    let items: [ItemToMatch]
    
    // The four items to be shown
    @State var upperLeft: ItemToMatch = testItem
    @State var upperRight: ItemToMatch = testItem
    @State var lowerLeft: ItemToMatch = testItem
    @State var lowerRight: ItemToMatch = testItem
    
    // Are the items to match hidden?
    @State var itemsHidden = true
    
    // The correct item
    @State var correctItem: ItemToMatch = testItem

    // MARK: Computed properties
    var body: some View {
        VStack {

            HStack(spacing: 5) {
                Image(upperLeft.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
                Image(upperRight.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
            }

            HStack(spacing: 5) {
                Image(lowerLeft.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
                Image(lowerRight.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
            }
            
            HStack {
                Text("Which one is the \n**\(correctItem.description)?**")
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical)

        }
        .padding(.horizontal)
        // Hide items at first
        .opacity(itemsHidden == true ? 0.0 : 1.0)
        // Runs as soon as this view is loaded
        .task {
            
            // Randomly select four items to display
            upperLeft = items.randomElement()!
            upperRight = items.randomElement()!
            lowerLeft = items.randomElement()!
            lowerRight = items.randomElement()!
            
            // Now make one of these items the correct item
            let someRandomValue = Int.random(in: 1...4)
            switch someRandomValue {
            case 1:
                correctItem = upperLeft
            case 2:
                correctItem = upperRight
            case 3:
                correctItem = lowerLeft
            case 4:
                correctItem = lowerRight
            default:
                break
            }
            
            // Show the items
            itemsHidden = false

        }
    }
}

struct MatchPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        MatchPresentationView(items: testItems)
    }
}
