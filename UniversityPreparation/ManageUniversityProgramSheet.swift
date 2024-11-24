//
//  ManageUniversityProgramSheet.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-17.
//

import SwiftUI

struct ManageUniversityProgramSheet: View {

    var isAddMode: Bool
    @Binding var univProgram: UniversityProgram
    @Binding var g11Reference: GradeInformation
    @Binding var g12Reference: GradeInformation
    //    @Binding var bigUnivProgramArray : [UniversityProgram]
    @State var preReqSubject_1: String = ""
    @State var preReqSubject_2: String = ""
    @State var preReqSubject_3: String = ""
    @State var preReqSubject_4: String = ""
    @State var preReqSubject_5: String = ""
    @State var preReqSubject_6: String = ""

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        //Back Link Setup
        setupSheetBackLinkNav(backNavLinkName: " University / College Programs")
            .onAppear {
                if !isAddMode {
                    if univProgram.preRequisiteSubjects.count >= 1 {
                        preReqSubject_1 = univProgram.preRequisiteSubjects[0]
                    }
                    if univProgram.preRequisiteSubjects.count >= 2 {
                        preReqSubject_2 = univProgram.preRequisiteSubjects[1]
                    }
                    if univProgram.preRequisiteSubjects.count >= 3 {
                        preReqSubject_3 = univProgram.preRequisiteSubjects[2]
                    }
                    if univProgram.preRequisiteSubjects.count >= 4 {
                        preReqSubject_4 = univProgram.preRequisiteSubjects[3]
                    }
                    if univProgram.preRequisiteSubjects.count >= 5 {
                        preReqSubject_5 = univProgram.preRequisiteSubjects[4]
                    }
                    if univProgram.preRequisiteSubjects.count >= 6 {
                        preReqSubject_6 = univProgram.preRequisiteSubjects[5]
                    }
                }
            }

        //Title Setup
        setupSheetTitle(titleString: isAddMode ? "Add Program" : "Edit Program")

        //FORM BEGIN
        VStack {
            VStack {
                HStack {
                    Text("University / College Program")
                        .font(.title3).fontWeight(.light).padding(.bottom, -3.0)
                        .padding(.top, 10.0)
                    Spacer()
                }.ignoresSafeArea()
                CustomDivider()
                //Form Start
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("University")
                            .textCase(.uppercase)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.contrastFG).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "University Name", text: $univProgram.universityName
                        )
                        .onChange(of: univProgram.universityName) { newValue in
                            if newValue.count > 30 {
                                univProgram.universityName = String(newValue.prefix(30))
                            }
                        }
                        .textFieldStyle(StandardTextFieldStyle())
                        if univProgram.universityName.count > 29 {
                            Text("30 characters max")
                                .textCase(.uppercase).font(.caption2)
                                .fontWeight(.regular).foregroundColor(
                                    Color.error
                                ).scaleEffect(0.9)
                        }
                        Text("Program")
                            .textCase(.uppercase)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.contrastFG).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "Program Name", text: $univProgram.programName
                        )
                        .onChange(of: univProgram.programName) { newValue in
                            if newValue.count > 30 {
                                univProgram.programName = String(newValue.prefix(30))
                            }
                        }
                        .textFieldStyle(StandardTextFieldStyle())
                        if univProgram.programName.count > 29 {
                            Text("30 characters max")
                                .textCase(.uppercase).font(.caption2)
                                .fontWeight(.regular).foregroundColor(
                                    Color.error
                                ).scaleEffect(0.9)
                        }
                        Text("Admission Range")
                            .textCase(.uppercase).font(.callout).fontWeight(
                                .regular
                            ).foregroundColor(Color.contrastFG).opacity(0.8)
                            .padding(.top, 6.0).padding(.leading, 3.0).padding(
                                .bottom, -2.0)
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Minimum GPA")
                                    .textCase(.uppercase)
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.contrastFG).opacity(
                                        0.8
                                    )
                                    .padding(.top, 6.0)
                                    .padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Minimum GPA",
                                    value: $univProgram.minimumGrade,
                                    format: .percent.precision(
                                        .fractionLength(1))
                                )
                                .textFieldStyle(StandardTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: univProgram.minimumGrade) {
                                    newValue in
                                    if newValue > 1.0 {
                                        univProgram.minimumGrade = 1.0
                                    }
                                }
                                if univProgram.minimumGrade > 1 {
                                    Text("100% or less")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Ideal GPA")
                                    .textCase(.uppercase)
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.contrastFG).opacity(
                                        0.8
                                    )
                                    .padding(.top, 6.0)
                                    .padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Ideal GPA",
                                    value: $univProgram.idealGrade,
                                    format: .percent.precision(
                                        .fractionLength(0))
                                )
                                .textFieldStyle(StandardTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .onChange(of: univProgram.idealGrade) {
                                    newValue in
                                    if newValue > 1.0 {
                                        univProgram.idealGrade = 1.0
                                    }
                                }
                                if univProgram.idealGrade > 1 {
                                    Text("100% or less")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                        }
                        Text("Pre-Requisite Subjects")
                            .textCase(.uppercase).font(.callout).fontWeight(
                                .regular
                            ).foregroundColor(Color.contrastFG).opacity(0.8)
                            .padding(.top, 6.0).padding(.leading, 3.0).padding(
                                .bottom, -2.0)
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Pre-Requisite 1")
                                    .textCase(.uppercase).font(.caption)
                                    .fontWeight(.regular).foregroundColor(
                                        Color.contrastFG
                                    ).opacity(0.8)
                                    .padding(.top, 6.0).padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Subject Identifier", text: $preReqSubject_1
                                )
                                .onChange(of: preReqSubject_1) { newValue in
                                    if newValue.count > 8 {
                                        preReqSubject_1 = String(newValue.prefix(8))
                                    }
                                }
                                .textFieldStyle(StandardTextFieldStyle())
                                if preReqSubject_1.count > 7 {
                                    Text("8 characters max")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Pre-Requisite 2")
                                    .textCase(.uppercase).font(.caption)
                                    .fontWeight(.regular).foregroundColor(
                                        Color.contrastFG
                                    ).opacity(0.8)
                                    .padding(.top, 6.0).padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Subject Identifier", text: $preReqSubject_2
                                )
                                .onChange(of: preReqSubject_2) { newValue in
                                    if newValue.count > 8 {
                                        preReqSubject_2 = String(newValue.prefix(8))
                                    }
                                }
                                .textFieldStyle(StandardTextFieldStyle())
                                if preReqSubject_2.count > 7 {
                                    Text("8 characters max")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                        }
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Pre-Requisite 3")
                                    .textCase(.uppercase).font(.caption)
                                    .fontWeight(.regular).foregroundColor(
                                        Color.contrastFG
                                    ).opacity(0.8)
                                    .padding(.top, 6.0).padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Subject Identifier", text: $preReqSubject_3
                                )
                                .onChange(of: preReqSubject_3) { newValue in
                                    if newValue.count > 8 {
                                        preReqSubject_3 = String(newValue.prefix(8))
                                    }
                                }
                                .textFieldStyle(StandardTextFieldStyle())
                                if preReqSubject_3.count > 7 {
                                    Text("8 characters max")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Pre-Requisite 4")
                                    .textCase(.uppercase).font(.caption)
                                    .fontWeight(.regular).foregroundColor(
                                        Color.contrastFG
                                    ).opacity(0.8)
                                    .padding(.top, 6.0).padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Subject Identifier", text: $preReqSubject_4
                                )
                                .onChange(of: preReqSubject_4) { newValue in
                                    if newValue.count > 8 {
                                        preReqSubject_4 = String(newValue.prefix(8))
                                    }
                                }
                                .textFieldStyle(StandardTextFieldStyle())
                                if preReqSubject_4.count > 7 {
                                    Text("8 characters max")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                        }
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Pre-Requisite 5")
                                    .textCase(.uppercase).font(.caption)
                                    .fontWeight(.regular).foregroundColor(
                                        Color.contrastFG
                                    ).opacity(0.8)
                                    .padding(.top, 6.0).padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Subject Identifier", text: $preReqSubject_5
                                )
                                .onChange(of: preReqSubject_5) { newValue in
                                    if newValue.count > 8 {
                                        preReqSubject_5 = String(newValue.prefix(8))
                                    }
                                }
                                .textFieldStyle(StandardTextFieldStyle())
                                if preReqSubject_5.count > 7 {
                                    Text("8 characters max")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Pre-Requisite 6")
                                    .textCase(.uppercase).font(.caption)
                                    .fontWeight(.regular).foregroundColor(
                                        Color.contrastFG
                                    ).opacity(0.8)
                                    .padding(.top, 6.0).padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                TextField(
                                    "Subject Identifier", text: $preReqSubject_6
                                )
                                .onChange(of: preReqSubject_6) { newValue in
                                    if newValue.count > 8 {
                                        preReqSubject_6 = String(newValue.prefix(8))
                                    }
                                }
                                .textFieldStyle(StandardTextFieldStyle())
                                if preReqSubject_6.count > 7 {
                                    Text("8 characters max")
                                        .textCase(.uppercase).font(.caption2)
                                        .fontWeight(.regular).foregroundColor(
                                            Color.error
                                        ).scaleEffect(0.9)
                                }
                            }
                        }
                        HStack(alignment: .top) {
                            //SAVE
                            Button {
                                if univProgram.universityName.isEmpty {
                                    print(
                                        "ManageUniversityProgramSheet: Blank Space Baby"
                                    )
                                } else {
                                    if isAddMode {
                                        print(
                                            "ManageUniversityProgramSheet: Add Mode"
                                        )
                                        var newPrerequisites: [String] = []
                                        if !preReqSubject_1.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_1)
                                        }
                                        if !preReqSubject_2.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_2)
                                        }
                                        if !preReqSubject_3.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_3)
                                        }
                                        if !preReqSubject_4.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_4)
                                        }
                                        if !preReqSubject_5.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_5)
                                        }
                                        if !preReqSubject_6.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_6)
                                        }
                                        univProgram.preRequisiteSubjects =
                                            newPrerequisites
                                        modelContext.insert(univProgram)
                                        univProgram = UniversityProgram(
                                            universityName: "", programName: "",
                                            minimumGrade: 0.0, idealGrade: 0.0,
                                            preRequisiteSubjects: [])
                                    } else {
                                        print(
                                            "ManageUniversityProgramSheet: Edit Mode"
                                        )
                                        var newPrerequisites: [String] = []
                                        if !preReqSubject_1.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_1)
                                        }
                                        if !preReqSubject_2.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_2)
                                        }
                                        if !preReqSubject_3.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_3)
                                        }
                                        if !preReqSubject_4.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_4)
                                        }
                                        if !preReqSubject_5.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_5)
                                        }
                                        if !preReqSubject_6.isEmpty {
                                            newPrerequisites.append(
                                                preReqSubject_6)
                                        }
                                        univProgram.preRequisiteSubjects =
                                            newPrerequisites
                                        modelContext.insert(univProgram)
                                    }
                                    dismiss()
                                }
                            } label: {
                                Text("Save Program")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.matchingBG)
                            }
                            .padding(.top, 20)
                            .buttonStyle(.borderedProminent)
                            .tint(.accent)

                            //DELETE
                            if !isAddMode {
                                Button {
                                    print(
                                        "ManageUniversityProgramSheet: Delete Mode -  Edit Mode"
                                    )
                                    modelContext.delete(univProgram)
                                    dismiss()
                                } label: {
                                    Text("Delete Program")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.matchingBG)
                                }
                                .padding(.top, 20)
                                .buttonStyle(.borderedProminent)
                                .tint(.error)
                            }
                        }
                    }
                    .padding(.horizontal, 5.0)
                    .padding(.vertical, 2.0)
                    Spacer()
                }
                //Form End
                CustomDivider()
            }
            .padding(.top, 1.0)
            .padding(.bottom, 10.0)
            .padding(.horizontal, 15)
            .background(Color.matchingBG)
            .cornerRadius(10)
            .shadow(color: .milderFG, radius: 3, x: 0, y: 4)
        }
        .padding([.leading, .trailing], 16.0)

        //FORM END
        Spacer().navigationBarBackButtonHidden(true)
    }
}
