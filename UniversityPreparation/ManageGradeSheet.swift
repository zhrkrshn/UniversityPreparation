//
//  ManageGradeSheet.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-17.
//

import SwiftUI

struct ManageGradeSheet: View {

    @Binding var activeGrade: GradeInformation
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var showAddSubjectSheet = false

    @State var emptySubject = EnrolledSubject(
        subjectIdentifier: "", subjectCurrentGrade: 0.0, isToBeIncluded: false)

    var body: some View {

        NavigationView {
            ScrollView {
                // Back Link Setup
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(Color.mint)
                            .controlSize(.extraLarge)
                        Text("Grades")
                            .font(.title3).fontWeight(.light)
                            .foregroundColor(.mint)
                        Spacer()
                    }
                }
                .padding([.leading, .trailing], 16)
                .padding([.top, .bottom], 10)
                .onTapGesture {
                    dismiss()
                }
                // Title Setup
                setupSheetTitle(
                    titleString: "Grade " + "\(activeGrade.gradeIdentifer)"
                        + " Setup")
                VStack {
                    VStack {
                        HStack {
                            Text(
                                "Grade " + "\(activeGrade.gradeIdentifer)"
                                    + " Summary"
                            )
                            .font(.title3).fontWeight(.light).padding(
                                .bottom, -3.0
                            )
                            .padding(.top, 10.0)
                            Spacer()
                        }
                        Divider()
                        coreDispayGradeSummaryCard(
                            gradeInformation: $activeGrade)
                        Divider()
                        HStack {
                            Text(
                                "Grade " + "\(activeGrade.gradeIdentifer)"
                                    + " Enrolled Subjects"
                            )
                            .font(.title3).fontWeight(.light)
                            .padding(.top, -12.0)
                            .padding(.bottom, -18.0)
                            .padding(.leading, -12)
                            Spacer()
                            NavigationLink(
                                destination: ManageSubjectSheet(
                                    isAddMode: true, currentGrade: $activeGrade,
                                    currentSubject: $emptySubject)
                            ) {
                                Image(systemName: "plus.circle")
                                    .imageScale(.large)
                                    .padding(.top, -10)
                                    .padding(.bottom, -9.0)
                                    .foregroundStyle(Color.mint)
                            }
                        }.padding()
                        Divider()
                        ForEach($activeGrade.enrolledSubjects) { subject in
                            NavigationLink(
                                destination: ManageSubjectSheet(
                                    isAddMode: false,
                                    currentGrade: $activeGrade,
                                    currentSubject: subject)
                            ) {
                                VStack(alignment: .leading) {
                                    displayEnrolledSubjectRow(
                                        theActiveEnrolledSubject: subject)
                                }.padding(.leading, 0)
                            }
                        }
                        if $activeGrade.enrolledSubjects.isEmpty {
                            ContentUnavailableView {
                                Image(systemName: "document.badge.plus")
                                    .foregroundColor(.mint)
                                    .imageScale(.large)
                                Text("No enrolled subjects found")
                                    .font(.title2).fontWeight(.light)
                            } description: {
                                NavigationLink(
                                    destination: ManageSubjectSheet(
                                        isAddMode: true,
                                        currentGrade: $activeGrade,
                                        currentSubject: $emptySubject)
                                ) {
                                    Text("Add a subject")
                                        .font(.headline).fontWeight(.regular)
                                        .foregroundColor(.mint)
                                }
                            }
                        }
                    }
                    .padding(.top, 1.0)
                    .padding(.bottom, 10.0)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3, x: 0, y: 4)
                }
                .padding([.leading, .trailing], 16.0)
                .padding(.top, -5)
            }
        }.navigationBarHidden(true)
        Spacer()
    }
    func doDelete(offsets: IndexSet) {
        activeGrade.enrolledSubjects.remove(atOffsets: offsets)
        modelContext.insert(activeGrade)
    }

}
struct displayEnrolledSubjectRow: View {
    @Binding var theActiveEnrolledSubject: EnrolledSubject

    var body: some View {
        HStack(alignment: .center) {
            Rectangle().frame(width: 2)
                .foregroundColor(.mint)
            VStack(alignment: .leading) {
                Text("Subject Code")
                    .textCase(.uppercase)
                    .font(.caption2).fontWeight(.light)
                    .foregroundColor(Color.black).opacity(0.6)
                Text(theActiveEnrolledSubject.subjectIdentifier)
                    .textCase(.uppercase)
                    .font(.title3).fontWeight(.light).foregroundColor(
                        Color.black)
            }.frame(width: 100).padding(.leading, -10)
            Spacer()
            VStack(alignment: .leading) {
                Text("Score")
                    .textCase(.uppercase)
                    .font(.caption2).fontWeight(.light)
                    .foregroundColor(Color.black).opacity(0.6)
                Text(
                    theActiveEnrolledSubject.subjectCurrentGrade.formatted(
                        .percent)
                )
                .textCase(.uppercase)
                .font(.title3).fontWeight(.light).foregroundColor(Color.black)
            }.padding(.horizontal, 10).frame(width: 100).padding(.leading, -10)
            Spacer()
            VStack(alignment: .leading) {
                Text("Grade 12?")
                    .textCase(.uppercase)
                    .font(.caption2).fontWeight(.light)
                    .foregroundColor(Color.black).opacity(0.6)
                    .padding(.bottom, 3)
                Image(
                    systemName: theActiveEnrolledSubject
                        .isToBeIncluded
                        ? "checkmark.square"
                        : "square"
                ).imageScale(.medium).padding(.bottom, 3).foregroundStyle(.mint)
            }.padding(.leading, -10)
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundStyle(Color.gray)
                .controlSize(.extraLarge)
                .padding(.leading, 20)
        }.padding(.horizontal, 0).padding(.top, 1).padding(.bottom, -1)
        Divider()

    }
}
