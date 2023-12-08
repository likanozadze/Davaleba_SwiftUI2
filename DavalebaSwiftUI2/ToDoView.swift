//
//  ContentView.swift
//  DavalebaSwiftUI2
//
//  Created by Lika Nozadze on 12/8/23.
//

import SwiftUI

struct ToDoView: View {
    
    struct Task: Identifiable {
        let id = UUID()
        let task: String
        let date: String
        let noteColor: Color
        var isCompleted: Bool
        
    }
    
    @State var tasks: [Task] = [
        Task(task: "Mobile App Research", date: "4 Oct", noteColor: Color(red: 1, green: 0.787, blue: 0.718), isCompleted: true),
        Task(task: "Prepare Wireframe for Main Flow", date: "4 Oct", noteColor: Color(red: 0.819, green: 0.945, blue: 1), isCompleted: true),
        Task(task: "Prepare Screens", date: "4 Oct", noteColor: Color(red: 1, green: 0.845, blue: 1), isCompleted: true),
        Task(task: "Website Research", date: "5 Oct", noteColor: Color(red: 1, green: 0.787, blue: 0.718), isCompleted: false),
        Task(task: "Prepare Wireframe for Main Flow", date: "5 Oct", noteColor: Color(red: 0.819, green: 0.945, blue: 1), isCompleted: false),
        Task(task: "Prepare Screens", date: "4 Oct", noteColor: Color(red: 1, green: 0.845, blue: 1), isCompleted: false)
    ]
    
    private var uncompletedTasksCount: Int {
                return tasks.filter { !$0.isCompleted }.count
            }
    
    private func tasksCompleted() {
                  for index in tasks.indices {
                      tasks[index].isCompleted = true
                  }
              }
        
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 35) {
                HStack {
                    Text("You have \(uncompletedTasksCount) tasks to complete")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("avatarPic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 20)
                                Text("\(uncompletedTasksCount)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 10))
                            },
                            alignment: .bottomTrailing
                        )
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Button {
                        tasksCompleted()
                    } label: {
                        Text("Complete All")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 186/255, green: 131/255, blue: 222/255), Color(red: 222/255, green: 131/255, blue: 176/255)]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .cornerRadius(10)
                    }
                    
                    Text("Progress")
                        .foregroundStyle(.white)
                        .font(.system(size: 22))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Daily Task")
                            .foregroundStyle(.white)
                            .font(.system(size: 18))
                        
                        Text("3/6 Task Completed")
                            .foregroundStyle(.white)
                            .font(.system(size: 16))
                            .opacity(0.8)
                        
                        HStack {
                            Text("Keep Working")
                                .foregroundStyle(.white)
                                .font(.system(size: 14))
                                .opacity(0.8)
                            
                            Spacer()
                            
                            Text("50%")
                                .foregroundStyle(.white)
                                .font(.system(size: 18))
                        }
                        ProgressView(value: 0.5)
                            .progressViewStyle(LinearProgressViewStyle(tint: Color.pink))
                    }
                  
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 25, trailing: 15))
                    .frame(maxHeight: 140)
                    .background(Color(red: 24/255, green: 24/255, blue: 24/255))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                VStack(alignment: .leading) {
                    Text("Completed Tasks")
                        .foregroundStyle(.white)
                        .font(.system(size: 22))
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach($tasks) { $todo in
                                HStack(spacing: 0) {
                                    Rectangle()
                                        .foregroundColor(todo.noteColor)
                                        .frame(width: 16, height: 80)
                                    
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(todo.task)
                                                .foregroundStyle(.white)
                                                .font(.system(size: 16))
                                            
                                            HStack {
                                                Image(systemName: "calendar")
                                                    .foregroundStyle(.white.opacity(0.8))
                                                Text(todo.date)
                                                    .font(.system(size: 14))
                                                    .foregroundStyle(.white.opacity(0.8))
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                            .symbolRenderingMode(todo.isCompleted ? .palette : .none)
                                            .foregroundStyle(todo.isCompleted ? .black : Color(red: 188/255, green: 131/255, blue: 222/255), Color(red: 188/255, green: 131/255, blue: 222/255))
                                            .font(.system(size: 25))
                                            .onTapGesture {
                                                 todo.isCompleted.toggle()
                                            }
                                    }
                                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 10))
                                    .foregroundStyle(.clear)
                                    .frame(height: 80)
                                    .background(Color(red: 0.12, green: 0.12, blue: 0.12))
                                }
                                .cornerRadius(8)
                            }
                            
                        }
                    }
                }
                Spacer()
            }
            
            .padding(.horizontal, 20)
            .padding(.vertical, 26)
        }
        
    }
}



#Preview {
    ToDoView()
}
