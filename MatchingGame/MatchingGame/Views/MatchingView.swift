//
//  MatchingView.swift
//  MatchingGame
//
//  Created by Russell Gordon on 2022-05-04.
//

import SwiftUI

struct MatchingView: View {
    
    // MARK: Stored properties
    
    // Stores the entire list of items we could make matches from
    @State var possibleItems: [ItemToMatch] = []
    
    // Stores an image to show
    @State var currentItem: ItemToMatch = testItem
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            Image(currentItem.image)
                .resizable()
                .scaledToFit()
        }
        .task {
            // Set list of flavours to the default list from the app bundle
            let url = Bundle.main.url(forResource: "items-to-match-with", withExtension: "json")!
            
            // Load the contents of the JSON file
            let data = try! Data(contentsOf: url)
            
            // DEBUG: What data was pulled from that file?
            print("Data loaded from JSON file in app bundle had this data...")
            print("===")
            print(String(data: data, encoding: .utf8)!)

            // Convert each JSON object into instances of the structure in the list
            possibleItems = try! JSONDecoder().decode([ItemToMatch].self, from: data)
            
            // DEBUG: How many items are there in the list now?
            print(dump(possibleItems))
            
            // Pick a random item to show, or if that doesn't work, show the test item
            currentItem = possibleItems.randomElement() ?? testItem
        }
        
    }
    
}

struct MatchingView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingView()
    }
}
