//
//  CalendarView.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/9/23.
//

import SwiftUI

struct CalendarView:View {
    
    @ObservedObject var viewModel = CalendarViewModel()
       
    var body: some View {
        NavigationView {
            
            VStack {
                CalendarHeader(viewModel: viewModel,month: $viewModel.month)
                CalendarGrid(viewModel: viewModel,month: $viewModel.month, clickedCurrentMonthDates: $viewModel.clickedCurrentMonthDates)
                Spacer()
            }
        }
    }
 
}

 




#Preview {
    CalendarView()
}
