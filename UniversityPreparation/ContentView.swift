//
//  ContentView.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    //Query UserName
    @Query var userInfoArray_DB: [UserInfo]

    //Query Grades
    @Query var gradeInformationArray: [GradeInformation]

    //Query university programs
    @Query(sort: \UniversityProgram.universityName) var universityPrograms:
        [UniversityProgram]

    //Primary Variables
    @State private var p_userName: String = "Student"
    @State private var p_grade11Info: GradeInformation = GradeInformation(gradeIdentifer: 11)
    @State private var p_grade12Info: GradeInformation = GradeInformation(gradeIdentifer: 12)
    @State private var p_universityPrograms: [UniversityProgram] = []
    @State private var p_prevUniversityName: String = ""
    @State private var p_continuePrevUniversity: Bool = false
    @State private var p_emptyUniversityProgram = UniversityProgram(universityName: "", programName: "", minimumGrade: 0.0, idealGrade: 0.0, preRequisiteSubjects: [])
    
//    @State private var showAddUnivSheet = false

    //Sheet Display Flags
    @State private var showManageNameSheet = false

    var body: some View {

        GeometryReader { g in
            NavigationView {
                ScrollView {
                    //
                    //Welcome Student Section
                    //
                    if p_userName.count <= 8 {
                        //One Line Mode
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {

                                Text("Welcome")
                                    .font(.largeTitle)
                                    .fontWeight(.light).padding(.leading, 20)
                                Text("\(p_userName)!")
                                    .font(.largeTitle)
                                    .fontWeight(.regular)
                                    .foregroundStyle(.mint)
                                Spacer()
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.large)
                                    .padding(.trailing, 15)
                                    .padding(.top, 5)
                                    .foregroundStyle(Color.black, Color.mint)
                                    .onTapGesture {
                                        showManageNameSheet = true
                                    }
                                    .sheet(isPresented: $showManageNameSheet) {
                                        ManageNameSheet(userName: $p_userName)
                                    }
                            }
                        }
                        .onAppear {
                            //Data Load Setup for User Name
                            if let savedUserInfo = userInfoArray_DB.first {
                                p_userName = savedUserInfo.userName
                            }
                        }
                    } else {
                        //Two Lines Mode
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text("Welcome")
                                    .font(.largeTitle)
                                    .fontWeight(.light).padding(.leading, 20)
                                Spacer()
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.large)
                                    .padding(.trailing, 15)
                                    .padding(.top, 5)
                                    .foregroundStyle(Color.black, Color.mint)
                                    .onTapGesture {
                                        showManageNameSheet = true
                                    }
                                    .sheet(isPresented: $showManageNameSheet) {
                                        ManageNameSheet(userName: $p_userName)
                                    }
                            }
                        }
                        .onAppear {
                            //Data Load Setup for User Name
                            if let savedUserInfo = userInfoArray_DB.first {
                                p_userName = savedUserInfo.userName
                            }
                        }
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text("\(p_userName)!")
                                    .font(.title)
                                    .fontWeight(.regular)
                                    .foregroundStyle(.mint)
                                    .padding(.leading, 20)
                                Spacer()
                            }
                        }
                    }
                    
                    //
                    //Grades Section
                    //
                    VStack {
                        VStack {
                            HStack {
                                Text("Grades")
                                    .font(.title2).fontWeight(.light).padding(.bottom, -3.0).padding(.top, 5.0)
                                Spacer()
                            }.ignoresSafeArea()
                            Divider()
                            NavigationLink(destination:ManageGradeSheet(activeGrade: $p_grade11Info)) {
                                dispayGradeSummaryCard(gradeInformation: $p_grade11Info)
                            }
                            Divider()
                            NavigationLink(destination:ManageGradeSheet(activeGrade: $p_grade12Info)) {
                                dispayGradeSummaryCard(gradeInformation: $p_grade12Info)
                            }
                        }
                        .padding(.top, 1.0)
                        .padding(.bottom, 10.0)
                        .padding(.horizontal, 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0, y: 4)
                    }
                    .padding([.leading, .trailing], 16.0)
                    .onAppear {
                        //Data Load Setup for Grades
                        if !gradeInformationArray.isEmpty {
                            for gradeInformation in gradeInformationArray {
                                if gradeInformation.gradeIdentifer == 11 {
                                    p_grade11Info = gradeInformation
                                }
                                else if gradeInformation.gradeIdentifer == 12 {
                                    p_grade12Info = gradeInformation
                                }
                            }
                        }
                    }.padding(.bottom,15)
                    // University Programs Section
                    VStack {
                        VStack {
                            HStack {
                                Text("University / College Programs").font(.title2).fontWeight(.light).padding(.bottom, -3.0).padding(.top, 5.0)
                                Spacer()
                                NavigationLink(destination:ManageUniversityProgramSheet(isAddMode: true, univProgram: $p_emptyUniversityProgram, g11Reference: $p_grade11Info, g12Reference: $p_grade11Info)) {
                                    Image(systemName: "plus.circle")
                                        .imageScale(.large)
                                        .padding(.top,5)
                                        .padding(.bottom,-2)
                                        .foregroundStyle(Color.mint)
                                }
                            }.ignoresSafeArea()
                            Divider()
                            ForEach($p_universityPrograms) { $universityProgram in
//                                if p_prevUniversityName == universityProgram.universityName {
//                                    p_continuePrevUniversity = true
//                                } else {
//                                    p_continuePrevUniversity = false
//                                    p_prevUniversityName = universityProgram.universityName
//                                }
                                NavigationLink(destination:ManageUniversityProgramSheet(isAddMode: false, univProgram: $universityProgram, g11Reference: $p_grade11Info, g12Reference: $p_grade11Info))
                                               {
                                    dispayUniversitySummaryCard(
                                        isSameUnivAsPrevious: $p_continuePrevUniversity, univProgram: $universityProgram ,g11Reference: $p_grade11Info, g12Reference: $p_grade11Info)
                                }
                            }
                        }
                        .padding(.top, 1.0)
                        .padding(.bottom, 10.0)
                        .padding(.horizontal, 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0, y: 4)
                    }
                    .padding([.leading, .trailing], 16.0)
                    .onAppear {
                        p_universityPrograms = universityPrograms
                    }
                }.frame(width: g.size.width, height: g.size.height)
            }
            .navigationBarHidden(true)
        }
        //Enrolled Subjects Experimentations End
        Spacer()
    }
}

#Preview {
    
    ContentView()
//    @Previewable @State var previewGradeInfo = GradeInformation(gradeIdentifer: 11)
//    ManageGradeSheet(activeGrade: $previewGradeInfo)
    
}
