//
//  MainView.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/17/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewRouter: ViewRouter = .init()
    
    var body: some View {
        VStack {
            
            if viewRouter.currentPage == "page0" {
                OnboardingView(viewRouter: viewRouter)
            }
            else if viewRouter.currentPage == "page1" {
                TabBarView()
            }
           
        }
    }
}

//#Preview {
//    MainView(viewRouter: ViewRouter())
//}
