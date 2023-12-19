//
//  ToDo.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/18/23.
//

import Foundation
import SwiftData

@Model
class ToDo: Identifiable {
    var id = UUID()
    var title: String
    var category: String
    var completed: Bool
    var day: Date
    var editMode: Bool
    
    
    init(title: String = "", category: String = "", completed: Bool = false, day: Date = .now, editMode: Bool = false) {
        self.title = title
        self.category = category
        self.completed = completed
        self.day = day
        self.editMode = editMode
    }
}

 
