//
//  OnboardingView.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-10.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    
    let univPlanData: UnivPlanData
    
    var body: some View {

        let onboardingSectionTitle: String = "Let's get started"
//        let gradesSectionTitle: String = "GRADES"
        PrettySectionBuilder(sectionTitle: onboardingSectionTitle){
            if !univPlanData.isOnboardingCompleteForAll {
                VStack{
                    OnboardingTaskView(taskCount: 1, taskDescription: univPlanData.setupNameLabel, taskCompleted: univPlanData.isOnboardingCompleteForUserName)
                    OnboardingTaskView(taskCount: 2, taskDescription: univPlanData.setupGrade11Label, taskCompleted: univPlanData.isOnboardingCompleteForGrade11)
                    OnboardingTaskView(taskCount: 3, taskDescription: univPlanData.setupGrade12Label, taskCompleted: univPlanData.isOnboardingCompleteForGrade12)
                    OnboardingTaskView(taskCount: 4, taskDescription: univPlanData.setupUniversityProgramsLabel, taskCompleted: univPlanData.isOnboardingCompleteForUniversityPrograms)
                    OnboardingTaskView(taskCount: 5, taskDescription: "Survive. Prevail. What else matters?", taskCompleted: true)
                }
            }
        }
        if !univPlanData.isOnboardingCompleteForAll {
            if !univPlanData.isOnboardingCompleteForUserName {
                //
            }
        }
        
        
        
    }
}


struct OnboardingView_Previews : PreviewProvider {
    
    static var previews: some View {

        let univPlanData = UnivPlanData(userInfoArray: [], gradeInformationArray: [], universityProgramsArray: [])
        
        OnboardingView(univPlanData: univPlanData)
        
    }
}
