//
//  ToDoListView.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/15/23.
//

import SwiftData
import SwiftUI

struct ToDoListView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [ToDo]
    @State private var input: String = ""
    
    @State var showingPopup = false
    @State private var sortOrder = SortDescriptor(\ToDo.category)
    
    var body: some View {
        NavigationView{
            VStack {
            
                List{
                    Section(header: sectionHeader) {
                        ForEach(todos) { todo in
                            HStack{
                                Image(systemName: todo.completed ? "checkmark.circle.fill": "circle")
                                    .onTapGesture {
                                        todo.completed.toggle()
                                    }
                                
                                if todo.editMode {
                                    VStack{
                                        TextField("update", text: $input)
                                            .onAppear(){
                                                todo.title = input
                                            }
                                        
                                        Rectangle()
                                            .frame(height:1)
                                            .foregroundStyle(.green)
                                    }
                                    Button("저장"){
                                        updateToDo(todo)
                                    }
                                } else{
                                    Text(todo.title)
                                        .onTapGesture {
                                            print("수정모드")
                                            changeEditMode(todo)
                                        }
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                        .onTapGesture {
                                            input = todo.title
                                            showingPopup.toggle()
                                        }
                                }
                            }
                            .frame(maxWidth:.infinity,alignment:.leading)
                    
                            
                        }
                        .onDelete(perform: { IndexSet in
                            for index in IndexSet{
                                deleteToDo(todos[index])
                            }
                        })
                    }
                  
                }
            
               
                
            }   
            .sheet(isPresented: $showingPopup) {
                ToDoDetailView(title: $input)
                    .presentationDetents([.medium])
                
            }
        }
        
    }
    

    // 새로운 텍스트필드 생성. 해당 카테고리에
    func addToDo(){
        let todo = ToDo(title: input)
        todo.title = input
        print("할일추가됨.")
        modelContext.insert(todo)
        todo.editMode = true
        input = ""
    }
   // 수정모드 바꿔주기
    func changeEditMode(_ todo: ToDo){
        print("수정모드 진입")
        todo.editMode = true
        input = todo.title
    }
    
    // 저장되는 곳
    // textfield가 비어있다면 삭제시키기
    func updateToDo(_ todo: ToDo){
      
        todo.title = input
        print(todo.id)
        print(todo.title)
        
        if todo.title.isEmpty {
            print("값이 비어있음!")
            deleteToDo(todo)
        }
        try? modelContext.save()
        todo.editMode = false
        input = ""
    }
    
    func deleteToDo(_ todo: ToDo){
        modelContext.delete(todo)
    }
    
}
 
extension ToDoListView{
    var sectionHeader: some View {
        HStack{
            Text("카테고리명")
            Spacer()
            Button("add"){
              addToDo()
            }
        }
    }
}
