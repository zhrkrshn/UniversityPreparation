//
//  GradeInformation.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import Foundation
import SwiftData

@Model
class GradeInformation{
    var GradeName: String
    var CurrentGradeScore: Float?
    var TargetGradeScore: Float?
    var EnrolledSubjects: [EnrolledSubject]?
    
    init(GradeName: String, CurrentGradeScore: Float?, TargetGradeScore: Float?, EnrolledSubjects: [EnrolledSubject]?) {
        self.GradeName = GradeName
        self.CurrentGradeScore = CurrentGradeScore
        self.TargetGradeScore = TargetGradeScore
        self.EnrolledSubjects = EnrolledSubjects
    }
}
