//
//  ContentView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    var admin: Bool
    
    @State private var teams = [String]()
    
    var body: some View {
    
    VStack {
    if(admin)
    {
        AdminView()
    }
    else
    {
        NavigationView{
        TeamLogListView(teams: teams).onAppear {
            retrieveTeams()
        }
        }
    }
        
    }
    }
    
    func retrieveTeams() -> Void
    {
        var arr = [String]()
        let db = Firestore.firestore()
        
        db.collection("teams").getDocuments { snapshot, err in
            
        if(snapshot != nil && err == nil)
        {
            let docs = snapshot!.documents
            for document in docs
            {
                arr.append(document.documentID)
            }
        }
            
            teams = arr
        }
    }//func end
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(admin: true)
    }
}
