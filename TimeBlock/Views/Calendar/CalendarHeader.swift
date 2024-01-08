//
//  CalendarHeader.swift
//  TimeBlock
//
//  Created by 김소혜 on 1/8/24.
//

import SwiftUI

struct CalendarHeader: View {
    
    @ObservedObject var viewModel = CalendarViewModel()
    @Binding var month: Date
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                yearMonthView
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
          
          HStack {
              
              ForEach(CalendarViewModel.weekdaySymbols.indices, id: \.self){ symbol in
                  Text(CalendarViewModel.weekdaySymbols[symbol].uppercased())
                     .foregroundColor(.gray)
                     .frame(maxWidth: .infinity)
                  
              }
          }
          .padding(.bottom, 5)
        }
    }
    
     var yearMonthView: some View {
       HStack(alignment: .center, spacing: 20) {
           
           Button {
               viewModel.changeMonth(by: -1)
           } label: {
               Image(systemName: "chevron.left")
                 .font(.title)
                 .foregroundColor(viewModel.canMoveToNextMonth() ? .black : . gray)
           }
           .disabled(!viewModel.canMoveToPreviousMonth())
         
           Text(month, formatter: CalendarViewModel.calendarHeaderDateFormatter)
           .font(.title.bold())
         
           Button {
               viewModel.changeMonth(by: 1)
           } label: {
               Image(systemName: "chevron.right")
                 .font(.title)
                 .foregroundColor(viewModel.canMoveToNextMonth() ? .black : .gray)
           }
           .disabled(!viewModel.canMoveToNextMonth())
       }
     }
     
}
//
//#Preview {
//    CalendarHeader()
//}
