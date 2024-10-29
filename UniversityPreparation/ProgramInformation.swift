//
//  ProgramInformation.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import Foundation
import SwiftData


@Model
class ProgramInformation{
    var UniversityName: String
    var ProgramName: String
    var MinAdmissionGradeScore: Float
    var IdealAdmissionGradeScore: Float
    var PrerequisiteSubjects: [String]?
    
    init(UniversityName: String, ProgramName: String, MinAdmissionGradeScore: Float, IdealAdmissionGradeScore: Float, PrerequisiteSubjects: [String]? = nil) {
        self.UniversityName = UniversityName
        self.ProgramName = ProgramName
        self.MinAdmissionGradeScore = MinAdmissionGradeScore
        self.IdealAdmissionGradeScore = IdealAdmissionGradeScore
        self.PrerequisiteSubjects = PrerequisiteSubjects
    }
}
