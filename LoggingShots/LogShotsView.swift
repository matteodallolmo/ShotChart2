//
//  LogShotsView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LogShotsView: View {
    
    @State private var teamname = ""
    @State private var strCapNum = ""
    @State private var shotType = 0
    @State private var shotResult = 0
    @State private var phase = 0
    @State private var isActive = false
    @State private var backButton = false
    @State private var errorMes = ""
    
    var body: some View {

Group {
VStack {
    Form {
        Section(header: Text("Team/Player")) {
            TextField("Cap Number", text: $strCapNum).keyboardType(.numbersAndPunctuation)
            Picker(selection: $teamname, label: Text("Select Team"), content: {
                Text("Harvard Westlake").tag("Harvard Westlake")
                Text("Mater Dei").tag("Mater Dei")
                Text("Huntington Beach").tag("Huntington Beach")
                Text("Loyola").tag("Loyola")
                Text("Newport").tag("Newport")
                Text("JSerra").tag("JSerra")
                Text("Olu").tag("Olu")
                Group {
                Text("Mira Costa").tag("Mira Costa")
                Text("Campolindo").tag("Campolindo")
                Text("Sacred Heart").tag("Sacred Heart")
                Text("Cathedral Catholic").tag("Cathedral Catholic")
                Text("Miramonte").tag("Miramonte")
                Text("Bishops").tag("Bishops")
                }
            })
        }
        
        Section(header: Text("Shot Attributes")) {
            Picker(selection: $shotType, label: Text("Select Shot Type"), content: {
                Text("Direct").tag(1)
                Text("Catch & Shoot").tag(2)
                Text("Fake").tag(3)
                Text("Drive").tag(4)
                Text("Pick Up").tag(5)
                Text("Backhand").tag(6)
                Text("Quick 6v5").tag(7)
                Group {
                Text("Over Pass").tag(8)
                Text("Skip").tag(9)
                Text("Lob").tag(10)
                Text("Transition").tag(11)
                }
            })
            
            Picker(selection: $shotResult, label: Text("Select Shot Result"), content: {
                Text("Goal").tag(1)
                Text("Field Block").tag(2)
                Text("Miss Goal").tag(3)
                Text("Tip Out").tag(4)
                Text("Goalie Block").tag(5)
                Text("Beat Field Blocker").tag(6)
            })
        }
        
        Section(header: Text("Phase of Game")) {
            Picker(selection: $phase, label: Text("Select Phase of Game"), content: {
                Text("6v6").tag(1)
                Text("6v5").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
        }
        
        Button(action: {
            
        if(self.validateFields() == nil)
        {
            self.isActive = true
        }
        else{
            errorMes = self.validateFields()!
        }
            
        }, label: {
            Text("Next")
        })
    }
    
    Text(errorMes).foregroundColor(.red).offset(y: 0)
    
    NavigationLink(destination: GoalView(teamname: self.teamname, strCapNum: self.strCapNum, shotType: self.shotType, shotResult: self.shotResult, phase: self.phase)
        .navigationBarTitle("")
        .navigationBarHidden(true), isActive: $isActive) {
        Text("")}
    
}//vstack end
    
}.navigationTitle("Shot Form")
    //group end
}//body end
    
    func validateFields() -> String? {
        if(teamname == "")
        {
            return "Please fill in all fields"
        }
        if(strCapNum == "")
        {
            return "Please fill in all fields"
        }
        if(Int(strCapNum) == nil)
        {
            return "Enter valid cap number"
        }
        if(shotType == 0)
        {
            return "Please fill in all fields"
        }
        if(shotResult == 0)
        {
            return "Please fill in all fields"
        }
        return nil
    }
    
}//struct end
