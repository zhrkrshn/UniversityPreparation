//
//  ContentView.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GradeInformation.GradeName) var grades: [GradeInformation]
    @Query(sort: \ProgramInformation.CreateTime) var programs: [ProgramInformation]
    @Query private var userInfo: [UserInfo]
    
    @State private var isNameFormPresented = false
    @State private var name: String = ""
    
    
    var body: some View {
        NavigationStack() {

//if text empty block
            //shows default text
            //enable action
//else
            //show standard wecome
//if grade 11 empty


            HStack {
                VStack{
                    HStack{ //Welcome HStack
                        Text(name.isEmpty ? "Welcome," : "Welcome,")
                            .font(.largeTitle)
                            .fontWeight(.light).padding(.leading, 20)
                        Text(name.isEmpty ? "Student!" : "\(name)!")
                            .font(.largeTitle)
                            .fontWeight(.regular)
                            .foregroundStyle(.mint)
                        Spacer()
                    }
                    HStack{
                        Text(name.isEmpty ? "Step 1 of 4 :" : "")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.leading, 22)
                        Text(name.isEmpty ? "Click to setup your name" : "")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(Color.blue)
                        Spacer()
                    }.padding(.top, -10)
                }  .onTapGesture {
                    isNameFormPresented = true
                }
            }
            .sheet(isPresented: $isNameFormPresented) {
                NameFormView(name: $name)
            }
            .onAppear {
                if let savedUserInfo = userInfo.first {
                    name = savedUserInfo.name
                }
            }
            
            // Add UI for GradeListContainer
            List {
                ForEach(grades) { grade in
                    // GradeSheet(grade: grade)
                }
            }
            // Add UI for ProgramListContainer
        }
    }
}

struct NameFormView: View {
    @Binding var name: String
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            Form {
                TextField("Enter your name", text: $name)
                    .padding()
            }
            .navigationTitle("Save your name!")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveName()
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveName() {
        let fetchDescriptor = FetchDescriptor<UserInfo>()
        if let existingUserInfo = try? modelContext.fetch(fetchDescriptor).first {
            modelContext.delete(existingUserInfo)
        }
        let newUserInfo = UserInfo(name: name)
        modelContext.insert(newUserInfo)
        try! modelContext.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [GradeInformation.self, ProgramInformation.self, UserInfo.self], inMemory: true)
}
