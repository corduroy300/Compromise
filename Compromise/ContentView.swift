//
//  ContentView.swift
//  Compromise
//
//  Created by Matthew Tran on 4/9/20.
//  Copyright © 2020 Capper Tech. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var people: [Person] = [Person(), Person(), Person(bills: [10, 0, 0, 0, 0, 0, 5])]
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {

        VStack {
            SelectRow()
            List(settings.people) { person in
                PersonRow(person: person)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings())
    }
}
