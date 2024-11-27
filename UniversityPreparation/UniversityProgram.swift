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


    
    func getPreRequisiteSubjectsCoverage(
        grade11Info: GradeInformation, grade12Info: GradeInformation
    ) -> some View {
        @Transient var localEnrolledSubjectList: [EnrolledSubject] = []
        @Transient var MatchedSubjectsCount: Int = 0
        @Transient var TotalSubjectCount: Int = preRequisiteSubjects.count
        @Transient var textColor: Color = .error
        localEnrolledSubjectList.append(contentsOf: grade11Info.enrolledSubjects)
        localEnrolledSubjectList.append(contentsOf: grade12Info.enrolledSubjects)
        
        
        for enrolledSubject in localEnrolledSubjectList {
            if preRequisiteSubjects.contains(enrolledSubject.subjectIdentifier) {
                MatchedSubjectsCount += 1
            }
        }
        
        if MatchedSubjectsCount == TotalSubjectCount {
            textColor = .accent
        }
        return Text("\(MatchedSubjectsCount) of \(TotalSubjectCount)")
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(textColor)
            .padding(.top, 0)
    }

    func getPerformanceGuidance(
        grade11Info: GradeInformation, grade12Info: GradeInformation
    ) -> some View {
        @Transient var localEnrolledSubjectList: [EnrolledSubject] = []
        @Transient var localPreRequisiteSubjectList: [String] = []
        @Transient var includedPreRequisiteCount: Int = 0
        @Transient var nonPreRequisiteCount: Int = 6
        @Transient var gradeTotal: Double = 0
        @Transient var GPA: Double = 0
        @Transient var textColor: Color = .error
        
        localEnrolledSubjectList.append(contentsOf: grade11Info.enrolledSubjects)
        localEnrolledSubjectList.append(contentsOf: grade12Info.enrolledSubjects)
        localEnrolledSubjectList = localEnrolledSubjectList.filter(\.self.isToBeIncluded)
        
        localPreRequisiteSubjectList = preRequisiteSubjects
        
        for enrolledSubject in localEnrolledSubjectList {
            if localPreRequisiteSubjectList.contains(enrolledSubject.subjectIdentifier) {
                includedPreRequisiteCount += 1
                gradeTotal += enrolledSubject.subjectCurrentGrade
                nonPreRequisiteCount -= 1
                localPreRequisiteSubjectList.remove(at: localPreRequisiteSubjectList.firstIndex(of: enrolledSubject.subjectIdentifier) ?? -1)
                localEnrolledSubjectList.remove(at: localEnrolledSubjectList.firstIndex(of: enrolledSubject) ?? -1)
            }
        }
        
        localEnrolledSubjectList.sort{$0.subjectCurrentGrade > $1.subjectCurrentGrade}
        if nonPreRequisiteCount > localEnrolledSubjectList.count {
            nonPreRequisiteCount = localEnrolledSubjectList.count
            
        }
        if nonPreRequisiteCount > 0 {
            for i in 1...nonPreRequisiteCount {
                let subject = localEnrolledSubjectList[i-1]
                gradeTotal += subject.subjectCurrentGrade
            }
        }
        if (nonPreRequisiteCount+includedPreRequisiteCount) > 0 {
            GPA = gradeTotal/Double(includedPreRequisiteCount + nonPreRequisiteCount)
        } else {
          GPA = 0
        }
        if GPA > minimumGrade {
            textColor = .accent
        }
        
        return Text(GPA.formatted(.percent.precision(.fractionLength(1))))
            .font(.title)
            .fontWeight(.regular)
            .foregroundColor(textColor)
            .padding(.top, 0)

    }
}
