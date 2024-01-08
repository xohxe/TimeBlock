//
//  CalendarGrid.swift
//  TimeBlock
//
//  Created by 김소혜 on 1/8/24.
//

import SwiftUI

struct CalendarGrid: View {
    
    @ObservedObject var viewModel = CalendarViewModel()
    @Binding var month: Date
    @Binding var clickedCurrentMonthDates: Date?
   
    var body: some View {
        
           LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
               ForEach(-viewModel.firstWeekday ..< viewModel.daysInMonth + viewModel.visibleDaysOfNextMonth, id: \.self) { index in
                    Group {
                        if index > -1 && index < viewModel.daysInMonth {
                            let date = viewModel.getDate(for: index)
                            let day = Calendar.current.component(.day, from: date)
                            let clicked = clickedCurrentMonthDates == date
                            let isToday = date.formattedCalendarDayDate == viewModel.today.formattedCalendarDayDate
                            CalendarCell(day: day, clicked:clicked, isToday:isToday)
        
                      } else if let prevMonthDate = Calendar.current.date(
                        byAdding: .day,
                        value: index + viewModel.lastDayOfMonthBefore,
                        to: viewModel.previousMonth()
                      ) {
                        let day = Calendar.current.component(.day, from: prevMonthDate)
        
                          CalendarCell(day: day,
                          isCurrentMonthDay: false)
                      }
                    }
                    .onTapGesture {
                        if 0 <= index && index < viewModel.daysInMonth {
                          let date = viewModel.getDate(for: index)
                          clickedCurrentMonthDates = date
                      }
                    }
                  }
                }
              
    }
}

 
