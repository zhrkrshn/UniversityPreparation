//
//  UniversityPreparationApp.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import SwiftUI
import SwiftData

@main
struct UniversityPreparationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [UserInfo.self, GradeInformation.self, ProgramInformation.self, EnrolledSubject.self])
    }
}
