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
//    @Query private var items: [Item]
    @Query(sort: \ProgramInformation.CreateTime) var programs: [ProgramInformation]
    var body: some View {
    
        
        
        NavigationStack{
            //Add UI for Welcome, {Name}
            //Add UI for GradeListContainer
            List{
                ForEach(grades) { grade in
//                   GradeSheet(grade: grade)
                }
            }
            //Add UI for ProgramListContainer
            //Add List for Programs
            //NavigationStack{} setup
        }
    }
    
    private func GradeSheet(grade: GradeInformation) {
        withAnimation {
            //Build grade display
        }
    }
    
    private func ProgramSheet(program: ProgramInformation) {
        withAnimation {
            //Build program display
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [GradeInformation.self, ProgramInformation.self], inMemory: true)
}
