//
//  AppData.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import Foundation
import SwiftData

@Model
class AppData {
    var Username: String
    var Grade11: GradeInformation
    var Grade12: GradeInformation
    var Programs: [ProgramInformation]
    
    init(Username: String, Grade11: GradeInformation, Grade12: GradeInformation, Programs: [ProgramInformation]) {
        self.Username = Username
        self.Grade11 = Grade11
        self.Grade12 = Grade12
        self.Programs = Programs
    }
}
