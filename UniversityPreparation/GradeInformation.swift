//
//  GradeInformation.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import Foundation
import SwiftData

@Model
final class GradeInformation {

    //Foundational Data Elements

    @Attribute(.unique) var gradeIdentifer: Int
    var currentGrade: Double = 0.0
    var targetGrade: Double = 0.0

    @Relationship(deleteRule: .cascade)
    var enrolledSubjects: [EnrolledSubject] = []

    init(gradeIdentifer: Int) {
        self.gradeIdentifer = gradeIdentifer
    }

    init(gradeIdentifer: Int, targetGrade: Double) {
        self.gradeIdentifer = gradeIdentifer
        self.targetGrade = targetGrade
    }

    func calcCurrentGrade() {
        var gradeSum: Double = 0.0
        var subjectCount: Int = 0

        for subject in self.enrolledSubjects {
            if subject.isValid() {
                gradeSum += subject.subjectCurrentGrade
                subjectCount += 1
            }
        }
        if gradeSum != 0.0 && subjectCount != 0 {
            self.currentGrade = gradeSum / Double(subjectCount)
        } else {
            self.currentGrade = 0.0
        }
    }
    func getActiveSubjectCount() -> Int {
        let activeSubjectFilter: (EnrolledSubject) -> Bool = { $0.isValid() }
        return self.enrolledSubjects.filter(activeSubjectFilter).count
    }
    func getTotalSubjectCount() -> Int {
        return self.enrolledSubjects.count
    }
    func getPerformanceGuidance() -> String {
        //self.calcCurrentGrade()
        if self.targetGrade == 0.0 {
            return "No target grade set"
        } else if self.currentGrade > self.targetGrade {
            return "Exceeding target of " + String(self.targetGrade)
        } else if self.currentGrade < self.targetGrade {
            return "Behind target of " + String(self.targetGrade)
        } else {
            return "Slacker! Meeting target of " + String(self.targetGrade)
        }
    }
    func isValid() -> Bool {
        if (self.currentGrade == 0.0) && (self.targetGrade == 0.0)
            && (self.enrolledSubjects.isEmpty)
        {
            return false
        } else {
            return true
        }
    }
}
