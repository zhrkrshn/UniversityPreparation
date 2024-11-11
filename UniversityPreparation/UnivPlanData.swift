//
//  UnivPlanData.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-10.
//

final class UnivPlanData {

    //Foundational Data Elements
    var userName: String
    var grade11Information: GradeInformation
    var grade12Information: GradeInformation
    var universityPrograms: [UniversityProgram] = []

    //    //OnboardingFlags
    var isOnboardingCompleteForUserName: Bool
    var isOnboardingCompleteForGrade11: Bool
    var isOnboardingCompleteForGrade12: Bool
    var isOnboardingCompleteForUniversityPrograms: Bool
    var isOnboardingCompleteForAll: Bool

    var setupNameLabel: String = "Setup your name"
    var setupGrade11Label: String = "Configure Grade 11"
    var setupGrade12Label: String = "Configure Grade 12"
    var setupUniversityProgramsLabel: String = "Setup your target programs"

    init(
        userInfoArray: [UserInfo], gradeInformationArray: [GradeInformation],
        universityProgramsArray: [UniversityProgram]
    ) {

        //Setup UserName
        if !userInfoArray.isEmpty {
            self.userName = userInfoArray.first!.userName
        } else {
            self.userName = ""
        }
        //Setup UserName Onboarding Status
        self.isOnboardingCompleteForUserName =
            self.userName.isEmpty ? false : true

        //Setup Grades
        self.grade11Information = GradeInformation(gradeIdentifer: 11)
        self.grade12Information = GradeInformation(gradeIdentifer: 12)

        if !gradeInformationArray.isEmpty {

            for gradeInformation in gradeInformationArray {
                if gradeInformation.gradeIdentifer == 11 {
                    self.grade11Information = gradeInformation
                } else if gradeInformation.gradeIdentifer == 12 {
                    self.grade12Information = gradeInformation
                }
            }
        }

        //Setup GradeInfo Onboarding Status
        self.isOnboardingCompleteForGrade11 =
            self.grade11Information.isValid() ? true : false
        self.isOnboardingCompleteForGrade12 =
            self.grade12Information.isValid() ? true : false

        //Setup University Programs

        if universityProgramsArray.isEmpty {
            self.isOnboardingCompleteForUniversityPrograms = false
        } else {
            self.universityPrograms.append(contentsOf: universityProgramsArray)
            self.isOnboardingCompleteForUniversityPrograms = true
        }

        //placeholder
        isOnboardingCompleteForAll = false
        checkOnboardingStatus()
    }
    func checkOnboardingStatus() {
        //Setup UserName Onboarding Status
        self.isOnboardingCompleteForUserName =
            self.userName.isEmpty ? false : true

        //Setup GradeInfo Onboarding Status
        self.isOnboardingCompleteForGrade11 =
            self.grade11Information.isValid() ? true : false
        self.isOnboardingCompleteForGrade12 =
            self.grade12Information.isValid() ? true : false

        //Setup University Programs Onboarding Status
        self.isOnboardingCompleteForUniversityPrograms =
            self.universityPrograms.isEmpty ? false : true

        if self.isOnboardingCompleteForUserName
            && self.isOnboardingCompleteForGrade11
            && self.isOnboardingCompleteForGrade12
            && self.isOnboardingCompleteForUniversityPrograms
        {
            self.isOnboardingCompleteForAll = true
        }
    }
}
