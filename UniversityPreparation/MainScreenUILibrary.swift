//
//  MainScreenUILibrary.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-17.
//

import SwiftUI

//Main Screen Grade Summary Card
struct dispayGradeSummaryCard: View {

    @Binding var gradeInformation: GradeInformation

    var body: some View {
        Rectangle().frame(width: 2)
            .foregroundColor(.mint)
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Grade " + "\(gradeInformation.gradeIdentifer)")
                    .textCase(.uppercase)
                    .font(.headline).fontWeight(.regular)
                    .foregroundColor(Color.black)
                Text(gradeInformation.currentGrade.formatted(.percent))
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color.mint)
                    .padding(.top, 0)
                Text("CALCULATED GPA")
                    .textCase(.uppercase)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(gradeInformation.getG12SubjectCount().formatted(.number))
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color.mint)
                    .padding(.top, 0)
                Text("Grade 12 Subjects")
                    .textCase(.uppercase)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }.padding(.leading, 2)
        Image(systemName: "chevron.forward")
            .foregroundStyle(Color.gray)
            .controlSize(.extraLarge)

    }
}
//Core Screen Grade Summary Card
//Same as Main but without Row Decorations (Green Bar / Chevron)
struct coreDispayGradeSummaryCard: View {

    @Binding var gradeInformation: GradeInformation

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(gradeInformation.currentGrade.formatted(.percent))
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color.mint)
                    .padding(.top, 0)
                Text("CALCULATED GPA")
                    .textCase(.uppercase)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(gradeInformation.getG12SubjectCount().formatted(.number))
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color.mint)
                    .padding(.top, 0)
                Text("Grade 12 Subjects")
                    .textCase(.uppercase)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }.padding(.leading, 2)
    }
}
#Preview {
    Text("Go preview something else, Idiot!")
    Text("This is a UILibary")
}

//Main Screen University Summary Card
struct dispayUniversitySummaryCard: View {

    @Binding var isSameUnivAsPrevious: Bool
    @Binding var univProgram: UniversityProgram
    @Binding var g11Reference: GradeInformation
    @Binding var g12Reference: GradeInformation

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                if !isSameUnivAsPrevious {
                    Text(univProgram.universityName)
                        .textCase(.uppercase)
                        .font(.headline).fontWeight(.regular)
                        .foregroundColor(Color.black)
                }
                HStack(alignment: .top) {
                    Rectangle().frame(width: 2)
                        .foregroundColor(.mint)
                    VStack(alignment: .leading) {
                        Text(univProgram.programName)
                            .font(.headline).fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                        HStack {
                            VStack(alignment: .leading) {
                                univProgram.getPreRequisiteSubjectsCoverage(
                                    grade11Info: g11Reference,
                                    grade12Info: g12Reference)
                                Text("Prerequisites")
                                    .textCase(.uppercase)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                univProgram.getPerformanceGuidance(
                                    grade11Info: g11Reference,
                                    grade12Info: g12Reference)
                                Text("Top 6 GPA")
                                    .textCase(.uppercase)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                        }.padding(.leading, 2)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(
                                    univProgram.minimumGrade.formatted(.percent)
                                )
                                .font(.title)
                                .fontWeight(.light)
                                .foregroundColor(Color.black).opacity(0.9)
                                .padding(.top, 0)
                                Text("Minimum GPA")
                                    .textCase(.uppercase)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text(univProgram.idealGrade.formatted(.percent))
                                    .font(.title)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.black).opacity(0.9)
                                    .padding(.top, 0)
                                Text("Ideal GPA")
                                    .textCase(.uppercase)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                        }.padding(.leading, 2)
                    }.padding(.leading, 5)
                }.padding(.leading, 5)

            }
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundStyle(Color.gray)
                .controlSize(.extraLarge)
        }.padding(.leading, 2)
        Divider()
    }
}
