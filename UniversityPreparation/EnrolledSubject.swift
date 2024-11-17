//
//  EnrolledSubject.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import Foundation
import SwiftData

@Model
final class EnrolledSubject {

    var subjectIdentifier: String
    var subjectCurrentGrade: Double = 0.0

    //The isToBeIncluded var is a tricky one
    //The flag indicates if this is a 4U/4M course
    //4U/4M Courses are considered for Univ Prog grade calculation
    //Irrespective of the 4U/4M status of subject, all the subjects should be used for the current grade % calculation

    var isToBeIncluded: Bool
    var parentGradeObject: GradeInformation?
    @Attribute(.unique) var id = UUID()

    init(
        subjectIdentifier: String, subjectCurrentGrade: Double,
        isToBeIncluded: Bool
    ) {
        self.subjectIdentifier = subjectIdentifier
        self.subjectCurrentGrade = subjectCurrentGrade
        self.isToBeIncluded = isToBeIncluded
        self.parentGradeObject = nil

    }

    init(
        subjectIdentifier: String, subjectCurrentGrade: Double,
        isToBeIncluded: Bool, parentGradeObject: GradeInformation
    ) {
        self.subjectIdentifier = subjectIdentifier
        self.subjectCurrentGrade = subjectCurrentGrade
        self.isToBeIncluded = isToBeIncluded
        self.parentGradeObject = parentGradeObject

    }
    func isValid() -> Bool {
        return (subjectCurrentGrade != 0.0 && !subjectIdentifier.isEmpty)
    }
}
