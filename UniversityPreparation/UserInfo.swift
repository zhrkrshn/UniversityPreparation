//
//  UserInfo.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-31.
//

import Foundation
import SwiftData

@Model
final class UserInfo {

    @Attribute(.unique) var Id: Int = 1
    var userName: String = ""

    init(userName: String) {
        self.userName = userName
    }
}
