//
//  UniversityProgram.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-10.
//

import Foundation
import SwiftData

@Model
final class UniversityProgram {

    var universityName: String
    var programName: String
    var minimumGrade: Double
    var idealGrade: Double
    var preRequisiteSubjects: [String] = []

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
}
