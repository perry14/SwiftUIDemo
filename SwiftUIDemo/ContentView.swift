//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by perry on 4/27/20.
//  Copyright © 2020 perry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
            
            Button("Tap me!") {
                print("Button was tapped")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
            }

            Button(action: {
                self.showingAlert = true
                print("Button was tapped")
            }) {
                Text("Tap me!")
            }

            Button(action: {
                print("Edit button was tapped")
            }) {
                Image(systemName: "pencil")
            }

            Button(action: {
                print("Edit button was tapped")
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
