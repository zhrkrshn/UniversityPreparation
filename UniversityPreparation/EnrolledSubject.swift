//
//  EnrolledSubject.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import Foundation
import SwiftData

@Model
class EnrolledSubject {
    var SubjectCode: String
    var CurrentEnrolledSubjectGrade: Float?
    var IncludeSubject: Bool
    
    init(SubjectCode: String, CurrentEnrolledSubjectGrade: Float? = nil, IncludeSubject: Bool) {
        self.SubjectCode = SubjectCode
        self.CurrentEnrolledSubjectGrade = CurrentEnrolledSubjectGrade
        self.IncludeSubject = IncludeSubject
    }
}
