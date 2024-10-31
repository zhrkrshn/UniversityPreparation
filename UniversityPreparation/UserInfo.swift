//
//  UserInfo.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-31.
//

import Foundation
import SwiftData

@Model
class UserInfo {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
