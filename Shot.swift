//
//  Shot.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/23/21.
//

import Foundation
import Firebase

struct Shot {
    var id: String
    var location: Int
    var phase: Int
    var result: Int
    var source: Int
    var type: Int
    
    init(doc: QueryDocumentSnapshot) {
        
        let dict = doc.data()
        id = doc.documentID
        location = dict["Location"] as! Int
        phase = dict["Phase"] as! Int
        result = dict["Result"] as! Int
        source = dict["Position"] as! Int
        type = dict["Type"] as! Int
    }
    
    func equals(temp: Shot) -> Bool
    {
        if(id == temp.id) { return true }
        return false
    }
}
