//
//  ContentView.swift
//  LengthConversion
//
//  Created by Frank Lopez on 2/1/21.
//
/*
    This app will be used for conversion it will use
 - Segmented controls
 - Binding using @State
 - Arrays
 - Protocols
 - Closures
 - Stacks. V Stack and h Stack
 - Navigation View
 */

import SwiftUI

struct ContentView: View {
    
    // State - manages the storage of any property you declare. When the state value changes, the view invalidates its appearance and recomputes the body
    @State private var userAmount = ""
    @State private var defaultUserPickForFirstPicker = 0
    @State private var defaultUserPickForSecondPicker = 0

    let unitsOfMeasurementToBeConverted = ["Meters", "Km", "Feet", "Yards", "Miles"]
    let unitsOfMeasurementToBeConvertedTo = ["Meters", "Km", "Feet", "Yards", "Miles"]
 
    // Computed properties
    var conversionCalculation: Measurement<UnitLength> {
        // converts user input to double nil coalescing operator to unWrap optional
        let unitConversion = Double(userAmount) ?? 0
        let defaultConversion = Measurement(value: 1, unit: UnitLength.inches)
        var conversion: Measurement<UnitLength> = defaultConversion.converted(to: UnitLength.centimeters)
        
        // Converts unitsOfMeasurementToBeConverted to string
        let unitsToBeConverted = String(unitsOfMeasurementToBeConverted[defaultUserPickForFirstPicker])
        let unitsToBeConvertedTo = String(unitsOfMeasurementToBeConvertedTo[defaultUserPickForSecondPicker])
        
        switch unitsToBeConverted {
        case "Meters":
            let meters = Measurement(value: unitConversion, unit: UnitLength.meters)
            if unitsToBeConvertedTo == "Meters" {
                conversion = meters.converted(to: UnitLength.meters)
            }
            else if unitsToBeConvertedTo == "Km" {
                conversion = meters.converted(to: UnitLength.kilometers)
            }
            else if unitsToBeConvertedTo == "Feet" {
                conversion = meters.converted(to: UnitLength.feet)
            }
            else if unitsToBeConvertedTo == "Yards" {
                conversion = meters.converted(to: UnitLength.yards)
            }
            else if unitsToBeConvertedTo == "Miles" {
                conversion = meters.converted(to: UnitLength.miles)
            }
        case "Km":
            let km = Measurement(value: unitConversion, unit: UnitLength.kilometers)
            if unitsToBeConvertedTo == "Meters" {
                conversion = km.converted(to: UnitLength.meters)
            }
            else if unitsToBeConvertedTo == "Km" {
                conversion = km.converted(to: UnitLength.kilometers)
            }
            else if unitsToBeConvertedTo == "Feet" {
                conversion = km.converted(to: UnitLength.feet)
            }
            else if unitsToBeConvertedTo == "Yards" {
                conversion = km.converted(to: UnitLength.yards)
            }
            else if unitsToBeConvertedTo == "Miles" {
                conversion = km.converted(to: UnitLength.miles)
            }
        case "Feet":
            let feet = Measurement(value: unitConversion, unit: UnitLength.feet)
            if unitsToBeConvertedTo == "Meters" {
                conversion = feet.converted(to: UnitLength.meters)
            }
            else if unitsToBeConvertedTo == "Km" {
                conversion = feet.converted(to: UnitLength.kilometers)
            }
            else if unitsToBeConvertedTo == "Feet" {
                conversion = feet.converted(to: UnitLength.feet)
            }
            else if unitsToBeConvertedTo == "Yards" {
                conversion = feet.converted(to: UnitLength.yards)
            }
            else if unitsToBeConvertedTo == "Miles" {
                conversion = feet.converted(to: UnitLength.miles)
            }
        case "Yards":
            let yards = Measurement(value: unitConversion, unit: UnitLength.yards)
            if unitsToBeConvertedTo == "Meters" {
                conversion = yards.converted(to: UnitLength.meters)
            }
            else if unitsToBeConvertedTo == "Km" {
                conversion = yards.converted(to: UnitLength.kilometers)
            }
            else if unitsToBeConvertedTo == "Feet" {
                conversion = yards.converted(to: UnitLength.feet)
            }
            else if unitsToBeConvertedTo == "Yards" {
                conversion = yards.converted(to: UnitLength.yards)
            }
            else if unitsToBeConvertedTo == "Miles" {
                conversion = yards.converted(to: UnitLength.miles)
            }
        case "Miles":
            let miles = Measurement(value: unitConversion, unit: UnitLength.miles)
            if unitsToBeConvertedTo == "Meters" {
                conversion = miles.converted(to: UnitLength.meters)
            }
            else if unitsToBeConvertedTo == "Km" {
                conversion = miles.converted(to: UnitLength.kilometers)
            }
            else if unitsToBeConvertedTo == "Feet" {
                conversion = miles.converted(to: UnitLength.feet)
            }
            else if unitsToBeConvertedTo == "Yards" {
                conversion = miles.converted(to: UnitLength.yards)
            }
            else if unitsToBeConvertedTo == "Miles" {
                conversion = miles.converted(to: UnitLength.miles)
            }
            
        default:
        conversion = defaultConversion.converted(to: UnitLength.inches)
        }
        
        return conversion
    }
    var body: some View{
        NavigationView {
            Form {
                TextField("Enter the amount", text: $userAmount)
                
                // First segmented control for the input unit
                Section(header: Text("Unit to be converted from")) {
                    Picker("Pick a unit to convert from", selection: $defaultUserPickForFirstPicker){
                        ForEach(0 ..< unitsOfMeasurementToBeConverted.count) {
                            Text("\(self.unitsOfMeasurementToBeConverted[$0])")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                // Second segmented control for the ouput unit
                Section(header: Text("Unit to be converted to")) {
                    Picker("Pick a unit to convert to", selection: $defaultUserPickForSecondPicker){
                        ForEach(0 ..< unitsOfMeasurementToBeConvertedTo.count) {
                            Text("\(self.unitsOfMeasurementToBeConvertedTo[$0])")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                // Displays the results
                Section(header: Text("Conversion amount")) {
                    Text("\(conversionCalculation.description)")
                }
            }
            
        }.navigationBarTitle("Length Conversion")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
