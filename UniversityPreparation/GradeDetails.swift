//
//  GradeDetails.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-10.
//

import SwiftUI

struct GradeDetails: View {
    
    @Binding var activeGrade: GradeInformation
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        @State var currentGradeString = "\(activeGrade.currentGrade)"
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("\(activeGrade.gradeIdentifer)")
        NavigationView
        {
            Form{
                Label{
                    Text("Current Grade")
                        .font(.body)
                        .foregroundColor(.primary)
                } icon: {
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color.mint)
                }
                TextField("Current Grade", text: $currentGradeString)
            }
            .font(.title3)
            .fontWeight(.light)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        //                        saveName()
                        dismiss()
                    }
                }
            }
        }
    }
}
