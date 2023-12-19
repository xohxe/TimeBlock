//
//  TimeBlockApp.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/3/23.
//

import SwiftData
import SwiftUI

@main
struct TimeBlockApp: App {
   // @StateObject var sheetMangager = SheetManager()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewRouter: ViewRouter())
//                .environmentObject(sheetMangager)
        }
        .modelContainer(for: ToDo.self)
    }
}


