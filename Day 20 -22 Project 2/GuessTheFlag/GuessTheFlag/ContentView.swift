//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Frank Lopez on 2/2/21.
//

import SwiftUI
// Day 20
//struct ContentView: View {
//    var body: some View {
//        Button(action: {
//            print("Button was tapped")
//        }) {
//            HStack {
//                Image(systemName: "pencil")
//                Text("Edit")
//            }
//        }
//    }
//}

// Day 21
struct ContentView: View {
    // Two properties to stoure our game data an array and integer
    // NOTE: Shuffled() method automatically takes care of randomizing the array order for us
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    // To store whether the alert is showing or not
    @State private var showingScore = false
    
    // To store the title that will be shown inside the alert:
    @State private var scoreTitle = ""
    
    // To store the user's score
    @State private var userScore = 0
    
    // To store the current flag that the user picked
    @State private var currentFlag = ""
    
    var body: some View {
        // Use ZStack to add something behind our outer VStack
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                // Layout our game prompt
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                // For Each loop to have tappable flag buttons
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        // number is given by ForEach
                        self.flagTapped(number)
                    }) {
                        
                        Image(self.countries[number])
                            .renderingMode(.original) // RenderingMode Orignal tells Swift UI to render orignial image
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Label("User score is \(userScore)", systemImage: "bolt.fill")
                    .foregroundColor(.white)
                Spacer() // This push the things in our outer VStack upwards
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore). That's the flag of \(currentFlag)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        
        /*
            Explantion of the alert() modifer.
         1. Use the alert() modifier so the alert gets presented when showingScore is true.
         2. Show the title we set in scoreTitle.
         3. Have a dismiss button that calls askQuestion() when tapped.
         4. At the end of the ZStack
         */
    }
    // Determines whether the correct flag was tapped or not
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 200
            currentFlag = countries[number]
        } else {
            scoreTitle = "Wrong"
            userScore -= 100
            currentFlag = countries[number]
        }
        showingScore = true
    }
    
    /*
        The askQuestion method resets the game by shuffling up the countries and picking a new correct answer.
     This answers the question "What happens when the alert is dismissed?"
     */
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
