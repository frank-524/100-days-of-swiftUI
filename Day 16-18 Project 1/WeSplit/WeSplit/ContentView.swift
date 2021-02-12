//
//  ContentView.swift
//  WeSplit
//
//  Created by Frank Lopez on 1/26/21.
//

import SwiftUI
/*
Day 16 project pt 1
 struct ContentView: View {
     let students = ["Frank", "Jerry", "Karen", "Elivs"]
     @State private var selectedStudent = 0
     
     var body: some View {
         VStack
         {
             Picker("Pick a student", selection: $selectedStudent)
             {
                 ForEach(0 ..< students.count)
                 {
                     Text(self.students[$0])
                 }
             }
             Text("You chose: Student #\(students[selectedStudent])")
         }
     }
     
 }
 
 */
/*
 Day 17 Project 1 pt 2
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        // Converts String to double
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView
        {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.numberPad)
                    
                    Picker("Number of people", selection: $numberOfPeople)
                    {
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
    
}
*/

// Day 18 Project 1 pt 3
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // Converts String to int
        let amountOfPeople = Int(numberOfPeople) ?? 0

        let peopleCount = amountOfPeople
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        // Converts String to double
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / Double(peopleCount)
        
        return amountPerPerson
    }
    
    var totalForOnePerson: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        // Converts String to double
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView
        {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.numberPad)
                    
                    /*
                     Picker("Number of people", selection: $numberOfPeople)
                     {
                         ForEach(2 ..< 100){
                             Text("\($0) people")
                         }
                     }
                     */
                    TextField("Number of people", text: $numberOfPeople)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                // Add a header to the third section
                Section(header: Text("Amount Per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                // Add another section showing the total amount without dividing
                Section(header: Text("Amount for one person")) {
                    Text("$\(totalForOnePerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
