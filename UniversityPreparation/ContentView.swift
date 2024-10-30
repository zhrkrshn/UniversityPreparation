//
//  ContentView.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import SwiftUI
import SwiftData

@Model
class UserInfo {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GradeInformation.GradeName) var grades: [GradeInformation]
    @Query(sort: \ProgramInformation.CreateTime) var programs: [ProgramInformation]
    @Query private var userInfo: [UserInfo]
    
    @State private var isNameFormPresented = false
    @State private var name: String = ""

    var body: some View {
        NavigationStack() {
            HStack {
                Text(name.isEmpty ? "Tap to enter a name!" : "Welcome, \(name)!")
                    .padding(.leading, 20)
                    .font(.largeTitle)
                    .onTapGesture {
                        isNameFormPresented = true
                    }
                Spacer()
            }
            .sheet(isPresented: $isNameFormPresented) {
                NameFormView(name: $name)
            }
            .onAppear {
                // Load the name from SwiftData if it exists
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
        // Create a FetchDescriptor to retrieve existing UserInfo records
        let fetchDescriptor = FetchDescriptor<UserInfo>()
        
        // Fetch existing UserInfo records and delete them
        if let existingUserInfo = try? modelContext.fetch(fetchDescriptor).first {
            modelContext.delete(existingUserInfo)
        }
        
        // Insert a new UserInfo entry with the updated name
        let newUserInfo = UserInfo(name: name)
        modelContext.insert(newUserInfo)
        
        // Save changes to SwiftData
        try! modelContext.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [GradeInformation.self, ProgramInformation.self, UserInfo.self], inMemory: true)
}
