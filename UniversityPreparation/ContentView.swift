//
//  ContentView.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-10-28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GradeInformation.GradeName) var grades: [GradeInformation]
   
    @Query(sort: \ProgramInformation.CreateTime) var programs: [ProgramInformation]
    @Query private var userInfo: [UserInfo]
    
    @State private var isNameFormPresented = false
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack() {

//if text empty block
            //shows default text
            //enable action
//else
            //show standard wecome
//if grade 11 empty


            HStack {
                VStack{
                    HStack{ //Welcome HStack
                        Text(name.isEmpty ? "Welcome," : "Welcome,")
                            .font(.largeTitle)
                            .fontWeight(.light).padding(.leading, 20)
                        Text(name.isEmpty ? "Student!" : "\(name)!")
                            .font(.largeTitle)
                            .fontWeight(.regular)
                            .foregroundStyle(.mint)
                        Spacer()
                    }
                    HStack{
                        Text(name.isEmpty ? "Step 1 of 4:" : "")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(.leading, 22)
                        Text(name.isEmpty ? "Setup your account" : "")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(Color.blue)
                        Spacer()
                    }.padding(.top, -10)
                }  .onTapGesture {
                    isNameFormPresented = true
                }
            }
            .sheet(isPresented: $isNameFormPresented) {
                NameFormView(name: $name)
            }
            .onAppear {
                if let savedUserInfo = userInfo.first {
                    name = savedUserInfo.name
                }
            }
            
            
            
            // Add UI for GradeListContainer
            VStack{
                VStack(alignment: .leading){
                    Text("GRADES").font(.title2).fontWeight(.light).padding(.bottom, -3.0)
                    
                    Divider()
                    HStack{
                        Text("Grade 11").font(.headline).fontWeight(.light).padding(.bottom, 2)
                        Spacer()
                        Image(systemName: "square.and.pencil")
                        
                    }
                    if grades.isEmpty {
                        HStack{
                            Text("Step 2 of 4:")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .padding(.leading, 15)
                            Text(name.isEmpty ? "Setup your grade 11" : "")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(Color.blue)
                            Spacer()
                        }.padding(.top, 0)
                    } else {
                        
                        
                    }
                    VStack{
                        HStack{
                            Text("COURSES")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                                .padding([.leading, .trailing], 15)
                            HStack{
                                
                            }.frame(width: 45)
                            HStack{
                                Text("4")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .padding([.leading, .trailing], -5)
                                Text(" Active")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .padding([.leading, .trailing], -5)
                                Text(" 8")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .padding([.leading, .trailing], -5)
                                Text(" Enrolled")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .padding([.leading, .trailing], -5)
                            }.frame(width: 200.0).padding([.leading, .trailing], -10)//.border(.black)
                        }
                        HStack(alignment: .top){
                            Text("PERFORMANCE")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                                .padding([.leading, .trailing], 15)
                            HStack{
                            }.frame(width: 45)
                            HStack(){
                                VStack(alignment: .leading){
                                    Text("45%")
                                        .font(.subheadline)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.mint)
                                        .padding([.leading, .trailing], -5)
                                    Text("Exceeds target of 45%")
                                        .font(.footnote)
                                        .fontWeight(.thin).italic()
                                        .foregroundColor(Color.gray)
                                        .padding(.leading, -7)
                                }//.border(.black)
                                Spacer()
                            }.frame(width: 157).padding([.leading, .trailing], -10)
                        }//.border(.black)
                    }
                    Divider()
                    HStack{
                        Text("Grade 12").font(.headline).fontWeight(.light).padding(.bottom, 2)
                        Spacer()
                        Image(systemName: "square.and.pencil")
                        
                    }
                    VStack{
                        HStack{
                            Text("COURSES")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                                .padding([.leading, .trailing], 15)
                            HStack{
                                
                            }.frame(width: 45)
                            HStack{
                                Text("0")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .padding([.leading, .trailing], -5)
                                Text(" Active")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .padding([.leading, .trailing], -5)
                                Text(" 0")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .padding([.leading, .trailing], -5)
                                Text(" Enrolled")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.gray)
                                    .padding([.leading, .trailing], -5)
                            }.frame(width: 200.0).padding([.leading, .trailing], -10)//.border(.black)
                        }
                        HStack(alignment: .top){
                            Text("PERFORMANCE")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                                .padding([.leading, .trailing], 15)
                            HStack{
                                
                            }.frame(width: 45)
                            HStack(){
                                VStack(alignment: .leading){
                                    Text("45%")
                                        .font(.subheadline)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.mint)
                                        .padding([.leading, .trailing], -5)
                                    Text("Projected from Grade 11")
                                        .font(.footnote)
                                        .fontWeight(.thin).italic()
                                        .foregroundColor(Color.gray)
                                        .padding(.leading, -7)
                                }//.border(.black)
                                Spacer()
                                
                            }.frame(width: 157).padding([.leading, .trailing], -10)
                        }//.border(.black)
                        
                    }
                }
                .padding(.all, 10.0)
                .background(.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0)
                    .stroke(.gray, lineWidth: 1))
                .shadow(color: .gray, radius: 3, x: 4, y: 4)
            }.padding([.leading, .trailing], 15)
            HStack{
                Spacer()
            }
            // Add UI for ProgramListContainer
        }
    }
}

struct NameFormView: View {
    @Binding var name: String
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            Form {
                Label {
                    Text("What do we call you?")
                        .font(.body)
                        .foregroundColor(.primary)
                } icon: {
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color.mint)
                }
                TextField("Your Name", text: $name)
                    
            }
            .font(.title3)
            .fontWeight(.light)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveName()
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveName() {
        let fetchDescriptor = FetchDescriptor<UserInfo>()
        if let existingUserInfo = try? modelContext.fetch(fetchDescriptor).first {
            modelContext.delete(existingUserInfo)
        }
        let newUserInfo = UserInfo(name: name)
        modelContext.insert(newUserInfo)
        try! modelContext.save()
    }
}

private func displayGradeLine(grade: GradeInformation) {
    //@State var courseString =
    VStack{
        HStack{
            Text("COURSES")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .padding([.leading, .trailing], 15)
            HStack{
                
            }.frame(width: 45)
            HStack{
                Text(String(countActiveSubjects(subjects: grade.EnrolledSubjects!)))
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding([.leading, .trailing], -5)
                Text(" Active")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding([.leading, .trailing], -5)
                Text(String(countTotalSubjects(subjects: grade.EnrolledSubjects!)))
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding([.leading, .trailing], -5)
                Text(" Enrolled")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding([.leading, .trailing], -5)
            }.frame(width: 200.0).padding([.leading, .trailing], -10)//.border(.black)
        }
        HStack(alignment: .top){
            Text("PERFORMANCE")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .padding([.leading, .trailing], 15)
            HStack{
            }.frame(width: 45)
            HStack(){
                VStack(alignment: .leading){
                    Text(String(grade.CurrentGradeScore))
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.mint)
                        .padding([.leading, .trailing], -5)
                    Text(getPerformanceString(grade: grade))
                        .font(.footnote)
                        .fontWeight(.thin).italic()
                        .foregroundColor(Color.gray)
                        .padding(.leading, -7)
                }//.border(.black)
                Spacer()
            }.frame(width: 157).padding([.leading, .trailing], -10)
        }//.border(.black)
    }
}
private func countActiveSubjects(subjects: [EnrolledSubject]) -> Int  {
    //iterate through courses and build that text HStack
    @State var activeSubjects = 0
    for subject in subjects {
        if !subject.SubjectCode.isEmpty {
            if subject.IncludeSubject == true{
                activeSubjects += 1
            }
        }
    }
    return activeSubjects
}
private func countTotalSubjects(subjects: [EnrolledSubject]) -> Int  {
    //iterate through courses and build that text HStack
    @State var totalSubjects = 0
    for subject in subjects {
        if !subject.SubjectCode.isEmpty {
            totalSubjects += 1
        }
    }
    return totalSubjects
}
private func getPerformanceString(grade : GradeInformation) -> String  {
    //iterate through courses and build that text HStack
    @State var perfString = ""
    
    if grade.TargetGradeScore > grade.CurrentGradeScore {
        perfString = "Below target of "
        perfString.append(String(grade.TargetGradeScore))
        perfString.append("%")
        return perfString
    }
    if grade.TargetGradeScore < grade.CurrentGradeScore {
        perfString = "Exceeds target of "
        perfString.append(String(grade.TargetGradeScore))
        perfString.append("%")
        return perfString
    }
    if grade.TargetGradeScore == grade.CurrentGradeScore {
        perfString = "Meeting target of "
        perfString.append(String(grade.TargetGradeScore))
        perfString.append("%")
        return perfString
    }
    
    if ((grade.TargetGradeScore == 0) && (grade.CurrentGradeScore == 0))
    {
        perfString = "No projections available"
        return perfString
    }

    return perfString
}


#Preview {
    ContentView()
        .modelContainer(for: [GradeInformation.self, ProgramInformation.self, UserInfo.self], inMemory: true)
}
