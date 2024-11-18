//
//  UniversityProgram.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-10.
//

import Foundation
import SwiftData
import SwiftUICore

@Model
final class UniversityProgram {

    var universityName: String
    var programName: String
    var minimumGrade: Double
    var idealGrade: Double
    var preRequisiteSubjects: [String] = []
    @Attribute(.unique) var id = UUID()

    //Flag variables
    var CURRENT_GRADE_IN_RANGE: Int = 1
    var CURRENT_GRADE_BELOW_RANGE: Int = 2
    var CURRENT_GRADE_ABOVE_RANGE: Int = 3

    init(
        universityName: String, programName: String, minimumGrade: Double,
        idealGrade: Double, preRequisiteSubjects: [String]
    ) {
        self.universityName = universityName
        self.programName = programName
        self.minimumGrade = minimumGrade
        self.idealGrade = idealGrade
        self.preRequisiteSubjects = preRequisiteSubjects
    }
    func isValid() -> Bool {
        if universityName.isEmpty || programName.isEmpty || minimumGrade.isNaN
            || idealGrade.isNaN || preRequisiteSubjects.isEmpty
        {
            return false
        } else {
            return true
        }
    }

    //TODO - ZOHAR WRITE THIS CODE - USE THIS STYING
    //ORANGE FOR MISSING PREREQS - MINT FOR MEETING PREREQS
    //CODE NEEDS TO CHECK preRequisiteSubjects AGAINST
    //            grade11Info.enrolledSubjects[] and
    //            grade12Info.enrolledSubjects[]
    //Create new functions for calculating stuff
    //and plug them back into this function (like color, 3 of 5 etc.)

    
    func getPreRequisiteSubjectsCoverage(
        grade11Info: GradeInformation, grade12Info: GradeInformation
    ) -> some View {
        Text("3 of 5")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.orange)
            .padding(.top, 0)
    }

    //TODO - ZOHAR WRITE THIS CODE - USE THIS STYING
    //ORANGE FOR MISSING NOT IN RANGE OR BELOW RANGE - MINT FOR IN OR ABOVE RANGE
    //CODE NEEDS TO USE preRequisiteSubjects first and
    //THEN 6 - preRequisiteSubjects.count should come from
    //grade11Info.enrolledSubjects[] and grade12Info.enrolledSubjects[]
    //Create new functions for calculating stuff
    //and plug them back into this function (like color, 3 of 5 etc.)

    func getPerformanceGuidance(
        grade11Info: GradeInformation, grade12Info: GradeInformation
    ) -> some View {
        Text("00.00%")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(Color.mint)
            .padding(.top, 0)

    }
}
