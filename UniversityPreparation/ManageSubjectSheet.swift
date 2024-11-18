//
//  ManageSubjectSheet.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-17.
//

import SwiftUI

struct ManageSubjectSheet: View {

    var isAddMode: Bool
    @Binding var currentGrade: GradeInformation
    @Binding var currentSubject: EnrolledSubject

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        //Back Link Setup
        setupSheetBackLinkNav(backNavLinkName: " Enrolled Subjects")

        //Title Setup
        setupSheetTitle(titleString: isAddMode ? "Add Subject" : "Edit Subject")

        //FORM BEGIN
        VStack {
            VStack {
                HStack {
                    Text("Enrolled Subject")
                        .font(.title3).fontWeight(.light).padding(.bottom, -3.0)
                        .padding(.top, 10.0)
                    Spacer()
                }.ignoresSafeArea()
                Divider()
                //Form Start
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Subject Identifier")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "Subject Identification String",
                            text: $currentSubject.subjectIdentifier
                        )
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .bottom], 2.0)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled(true)
                        Text("Current Score")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        TextField(
                            "Set your current score",
                            value: $currentSubject.subjectCurrentGrade,
                            format: .percent
                        )
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .bottom], 2.0)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled(true)
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Toggle(isOn: $currentSubject.isToBeIncluded) {
                                    Text("IS Grade 12 Subject?")
                                        .textCase(.uppercase)
                                        .font(.caption)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.black).opacity(
                                            0.8
                                        )
                                        .padding(.leading, 3.0)
                                    Text(
                                        "Only Grade 12 subjects will be used to \ncalculate your top 6 GPA for university/college"
                                    )
                                    .font(.footnote)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.black).opacity(0.6)
                                    .padding(.top, -5.0)
                                    .padding(.leading, 3.0)
                                    .padding(.bottom, -2.0)
                                }.toggleStyle(.switch).padding(.trailing, 10)
                                    .tint(.mint)
                            }
                        }

                        HStack(alignment: .top) {
                            //SAVE
                            Button {
                                print("ManageSubjectSheet: Save Button Action")
                                if currentSubject.subjectIdentifier.isEmpty {
                                    print("ManageSubjectSheet: Blank Space Baby")
                                    append10()
//                                    currentGrade.calcCurrentGrade()
                                } else {
                                    print(
                                        "ManageSubjectSheet: Not Empty")
                                    if isAddMode {
                                        print(
                                            "ManageSubjectSheet: Not Empty - Add Mode")
                                        currentGrade.enrolledSubjects.append(
                                            currentSubject)
                                        currentGrade.calcCurrentGrade()
                                        modelContext.insert(currentGrade)
                                        currentSubject = EnrolledSubject(
                                            subjectIdentifier: "",
                                            subjectCurrentGrade: 0.0,
                                            isToBeIncluded: false)
                                    } else {
                                        print(
                                            "ManageSubjectSheet: Not Empty - Edit Mode")
                                        currentGrade.calcCurrentGrade()
                                        modelContext.insert(currentGrade)
                                    }
                                    dismiss()
                                }
                            } label: {
                                Text("Save Subject")
                                    .frame(maxWidth: .infinity)
                            }
                            .padding(.top, 20)
                            .buttonStyle(.borderedProminent)
                            .tint(.mint)

                            //DELETE
                            Button {
                                if isAddMode {
                                    currentSubject = EnrolledSubject(
                                        subjectIdentifier: "",
                                        subjectCurrentGrade: 0.0,
                                        isToBeIncluded: false)
                                } else {

                                    do {
                                        currentGrade.enrolledSubjects.remove(
                                            at: currentGrade.enrolledSubjects
                                                .firstIndex(of: currentSubject)
                                                ?? -1)
                                        currentGrade.calcCurrentGrade()
                                        modelContext.insert(currentGrade)
                                    } catch {
                                        print("Epic Fail")
                                    }
                                }
                                dismiss()
                            } label: {
                                Text("Delete Subject")
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
    func append10() {

        for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16] {
            let subject = EnrolledSubject(
                subjectIdentifier: "MCR_" + "\(i)", subjectCurrentGrade: 0.90,
                isToBeIncluded: true)
            currentGrade.enrolledSubjects.append(subject)
        }
    }
}