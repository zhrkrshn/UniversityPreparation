//
//  UnivPlanDisplayLibrary.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-10.
//

import Foundation
import SwiftUI

// Context and Tutorial
// https://www.fivestars.blog/articles/design-system-composing-views/
// PrettySectionBuilder apply formating to a visual section of the app

struct PrettySectionBuilder<ViewContent: View>: View {

    var sectionTitle: String
    var viewContent: ViewContent

    init(
        sectionTitle: String,
        @ViewBuilder insideOfMe: () -> ViewContent
    ) {
        self.sectionTitle = sectionTitle
        self.viewContent = insideOfMe()
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(sectionTitle).font(.title2).fontWeight(.light).padding(
                    .bottom, -3.0)
                Divider()
                viewContent
            }
            .padding(.all, 10.0)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0)
                    .stroke(.gray, lineWidth: 1)
            )
            .shadow(color: .gray, radius: 3, x: 4, y: 4)
        }
        .background(Color.white)
        .padding([.leading, .trailing], 16)
        .padding([.top, .bottom], 3)
    }
}

struct GradeInformationDisplay: View {

    let gradeInformation: GradeInformation
    
    @State private var showGradeDetailsOverlay = false


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Grade " + "\(gradeInformation.gradeIdentifer)").font(
                    .headline
                ).fontWeight(.light).padding(.bottom, 2)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .onTapGesture {
                        showGradeDetailsOverlay = true
                    }
                }
                .sheet(isPresented: $showGradeDetailsOverlay) {
                    
                GradeDetails(activeGrade: gradeInformation)
                }
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Text("COURSES")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], 15)
                        Spacer()
                    }.frame(width: 150.0)
                    HStack {
                        Text(String(gradeInformation.getActiveSubjectCount()))
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding([.leading, .trailing], -5)
                        Text(" Active ")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], -5)
                        Text(String(gradeInformation.getTotalSubjectCount()))
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding([.leading, .trailing], -5)
                        Text(" Enrolled")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], -5)
                    }
                }
                HStack(alignment: .top) {
                    HStack {
                        Text("PERFORMANCE")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], 15)
                        Spacer()
                    }.frame(width: 150.0)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(gradeInformation.currentGrade)" + " %")
                                //                            Text("0.0" + " %")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.mint)
                                .padding([.leading, .trailing], -5)
                            Text(gradeInformation.getPerformanceGuidance())
                                //                            Text("Hello ")
                                .font(.footnote)
                                .fontWeight(.thin).italic()
                                .foregroundColor(Color.gray)
                                .padding(.leading, -7)
                        }
                        Spacer()

                    }
                }

            }
        }
    }

}

//Takes an onboarding task and displays it
struct OnboardingTaskView: View {
    let taskCount: Int
    let taskDescription: String
    let taskCompleted: Bool

    var body: some View {
        HStack {
            Image(systemName: "\(taskCount)" + ".circle")
            LabeledContent(taskDescription) {
                Image(
                    systemName: taskCompleted
                        ? "checkmark.circle.fill" : "circle"
                ).foregroundStyle(Color.black, Color.mint)
            }
            .padding(.vertical, 4.0)
            .font(.headline).fontWeight(.light)
        }
    }

}

//Takes an onboarding task and displays it
struct OnboardingTaskAction: View {
    let taskCount: Int
    let taskDescription: String
    let taskCompleted: Bool

    var body: some View {
        HStack {
            Image(systemName: "\(taskCount)" + ".circle")
            LabeledContent(taskDescription) {
                Image(
                    systemName: taskCompleted
                        ? "checkmark.circle.fill" : "circle"
                ).foregroundStyle(Color.black, Color.mint)
            }
            .padding(.vertical, 4.0)
            .font(.headline).fontWeight(.light)
        }
    }

}
