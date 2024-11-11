//
//  ContentView.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    //Query UserName
    @Query var userInfoArray: [UserInfo]

    //Query Grades
    @Query var gradeInformationArray: [GradeInformation]

    //Query university programs
    @Query(sort: \UniversityProgram.universityName) var universityPrograms:
        [UniversityProgram]

    var univPlanData: UnivPlanData {
        .init(
            userInfoArray: userInfoArray,
            gradeInformationArray: gradeInformationArray,
            universityProgramsArray: universityPrograms)
    }

    let onboardingSectionTitle: String = "LET'S GET STARTED"
    let gradesSectionTitle: String = "GRADES"
    
    var body: some View {

        //OnboardingView(univPlanData: univPlanData)
        
        PrettySectionBuilder(sectionTitle: gradesSectionTitle) {
                GradeInformationDisplay(gradeInformation: univPlanData.grade11Information)
                GradeInformationDisplay(gradeInformation: univPlanData.grade12Information)
        }
        
        PrettySectionBuilder(sectionTitle: "Test Data") {
            VStack {
                LabeledContent("User Name Onboarding Done ?") {
                    Text(String(univPlanData.isOnboardingCompleteForUserName))
                        .font(.subheadline)
                }
                LabeledContent("Grade 11 Onboarding Done ?") {
                    Text(String(univPlanData.isOnboardingCompleteForGrade11))
                        .font(.subheadline)
                }
                LabeledContent("Grade 11 Identifier") {
                    Text(String(univPlanData.grade11Information.gradeIdentifer))
                        .font(.subheadline)
                }
                LabeledContent("Grade 11 Enrolled Subjects Count") {
                    Text(
                        String(
                            univPlanData.grade11Information.enrolledSubjects
                                .count)
                    )
                    .font(.subheadline)
                }
                LabeledContent("Grade 12 Onboarding Done ?") {
                    Text(String(univPlanData.isOnboardingCompleteForGrade12))
                        .font(.subheadline)
                }
                LabeledContent("Grade 12 Identifier") {
                    Text(String(univPlanData.grade12Information.gradeIdentifer))
                        .font(.subheadline)
                }
                LabeledContent("Grade 12 Enrolled Subjects Count") {
                    Text(
                        String(
                            univPlanData.grade12Information.enrolledSubjects
                                .count)
                    )
                    .font(.subheadline)
                }
                LabeledContent("Univ Programs Onboarding Done ?") {
                    Text(
                        String(
                            univPlanData
                                .isOnboardingCompleteForUniversityPrograms)
                    )
                    .font(.subheadline)
                }
                LabeledContent("Univ Program Count") {
                    Text(String(univPlanData.universityPrograms.count))
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
