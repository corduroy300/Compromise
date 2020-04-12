//
//  SelectRow.swift
//  Compromise
//
//  Created by Matthew Tran on 4/9/20.
//  Copyright © 2020 Capper Tech. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject{
    @Published var numberOfPeople = 0
    @Published var totalAmount: Int = 0
    @Published var people: [Person] = []
}

func CreatePeopleArray(numberOfPeople: Int) -> [Person] {
    var people: [Person] = []
    for _ in 0 ..< numberOfPeople {
        people.append(Person())
    }
    return people
}

struct SelectRow: View {
    
    @EnvironmentObject var settings: UserSettings
    @State var numberOfPeople = 2
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $settings.numberOfPeople, label: Text("Number of People")) {
                        ForEach(0 ..< 100) { index in
                            Text("\(index)")
                        }
                    }
                    Button(action: {
                        print("SwiftUI: Button tapped")
                            self.settings.people = CreatePeopleArray(numberOfPeople: self.settings.numberOfPeople)
                    }) {
                        Text("Create Group")
                    }
                }
            }
        .navigationBarTitle("Options")
        }
    }
}

struct SelectRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectRow().environmentObject(UserSettings())
    }
}
