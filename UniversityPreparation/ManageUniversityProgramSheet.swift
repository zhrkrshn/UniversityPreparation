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
                    //                    preReqSubject_1 = univProgram.preRequisiteSubjects[0]
                    //                    preReqSubject_2 = univProgram.preRequisiteSubjects[1]
                    //                    preReqSubject_3 = univProgram.preRequisiteSubjects[2]
                    //                    preReqSubject_4 = univProgram.preRequisiteSubjects[3]
                    //                    preReqSubject_5 = univProgram.preRequisiteSubjects[4]
                    //                    preReqSubject_6 = univProgram.preRequisiteSubjects[5]
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
                Divider()
                //Form Start
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("University")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "University Name", text: $univProgram.universityName
                        )
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .bottom], 2.0)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled(true)
                        Text("Program")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "Program Name", text: $univProgram.programName
                        )
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .bottom], 2.0)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled(true)
                        Text("Admission Range - Minimum GPA")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "Minimum GPA",
                            value: $univProgram.minimumGrade,
                            format: .percent
                        )
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .bottom], 2.0)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled(true)
                        Text("Admission Range - Ideal GPA")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "Ideal GPA",
                            value: $univProgram.idealGrade,
                            format: .percent
                        )
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .bottom], 2.0)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled(true)

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

                                        //                                        currentGrade.enrolledSubjects.append(currentSubject)
                                        //                                        currentGrade.calcCurrentGrade()
                                        //                                        modelContext.insert(currentGrade)
                                        //                                        currentSubject = EnrolledSubject(subjectIdentifier: "", subjectCurrentGrade: 0.0, isToBeIncluded: false)
                                    } else {
                                        //                                        currentGrade.calcCurrentGrade()
                                        //                                        modelContext.insert(currentGrade)
                                        print(
                                            "ManageUniversityProgramSheet: Edit Mode"
                                        )
                                    }
                                    dismiss()
                                }
                            } label: {
                                Text("Save Program")
                                    .frame(maxWidth: .infinity)
                            }
                            .padding(.top, 20)
                            .buttonStyle(.borderedProminent)
                            .tint(.mint)

                            //DELETE
                            Button {
                                print(
                                    "ManageUniversityProgramSheet: Delete Mode")

                                //                                if (isAddMode){
                                //                                    currentSubject = EnrolledSubject(subjectIdentifier: "", subjectCurrentGrade: 0.0, isToBeIncluded: false)
                                //                                }
                                //                                else {
                                //
                                //                                    do
                                //                                    {
                                //                                        currentGrade.enrolledSubjects.remove(at: currentGrade.enrolledSubjects.firstIndex(of: currentSubject) ?? -1)
                                //                                        currentGrade.calcCurrentGrade()
                                //                                        modelContext.insert(currentGrade)
                                //                                    }
                                //                                    catch
                                //                                    {
                                //                                        print("Epic Fail")
                                //                                    }
                                //                                }
                                dismiss()
                            } label: {
                                Text("Delete Program")
                                    .frame(maxWidth: .infinity)
                            }
                            .padding(.top, 20)
                            .buttonStyle(.borderedProminent)
                            .tint(.orange)

                        }
                    }
                    .padding(.horizontal, 5.0)
                    .padding(.vertical, 2.0)
                    Spacer()
                }
                //Form End
                Divider()
            }
            .padding(.top, 1.0)
            .padding(.bottom, 10.0)
            .padding(.horizontal, 15)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 0, y: 4)
        }
        .padding([.leading, .trailing], 16.0)

        //FORM END
        Spacer().navigationBarBackButtonHidden(true)
    }
}
