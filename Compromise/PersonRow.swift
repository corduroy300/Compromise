//
//  PersonRow.swift
//  Compromise
//
//  Created by Matthew Tran on 4/9/20.
//  Copyright © 2020 Capper Tech. All rights reserved.
//

import SwiftUI

func CalculateBills(amount: Int) -> [[Int]] {
    let possibleBills = [[0, 2, 5, 10, 20, 50, 100], [1, 2, 5, 10, 20, 50, 100]]
    return possibleBills
}

struct Person: Identifiable & Hashable {
    let id: UUID = UUID.init()
    let bills: [Int]
    let denominations: [Int] = [1, 2, 5, 10, 20, 50, 100]
    var amount: Int = 0
    
    init() {
        bills = [0, 0, 0, 0, 0, 0, 0]
    }
    
    init(bills: [Int]) {
        self.bills = bills
        for i in 0 ..< denominations.count {
            amount += (denominations[i] * bills[i])
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PersonRow: View {
    @State var person: Person
    var selectedBills = 0
    
    var body: some View {
        VStack {
            Text("\(person.id.uuidString)")
            Text("\(person.amount)")
            TextField("Enter your amount", value: $person.amount, formatter: NumberFormatter())
            
            Button(action: {
                print("SwiftUI: Button tapped")
            }) {
                Text("Calculate Bills")
            }
        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            PersonRow(person: Person())
//            PersonRow(person: Person())
            PersonRow(person: Person(bills: [10, 0, 0, 0, 0, 0, 5]))
        }
//        .previewLayout(.fixed(width: 300, height: 70))
    }
}
