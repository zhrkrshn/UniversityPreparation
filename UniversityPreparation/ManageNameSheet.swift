//
//  ManageNameSheet.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-17.
//

import SwiftUI

struct ManageNameSheet: View {

    @Binding var userName: String
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        //Back Link Setup
        setupSheetBackLinkNav(backNavLinkName: "Main Screen")
        //Title Setup
        setupSheetTitle(titleString: "Manage User Information")

        VStack {
            VStack {
                HStack {
                    Text("Your Information")
                        .font(.title3).fontWeight(.light).padding(.bottom, -3.0)
                        .padding(.top, 10.0)
                    Spacer()
                }.ignoresSafeArea()
                Divider()
                //Form Start
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Your Name")
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black).opacity(0.8)
                            .padding(.top, 6.0)
                            .padding(.leading, 3.0)
                            .padding(.bottom, -2.0)
                        VStack(alignment: .leading) {
                            TextField("What do we call you ?", text: $userName)
                                .font(.headline)
                                .fontWeight(.light)
                                .padding([.leading, .bottom], 2.0)
                                .textFieldStyle(.roundedBorder)
                                .autocorrectionDisabled(true)
                                .onSubmit {
                                    print("OnSubmit >>" + userName)
                                }
                            Button {
                                if userName.isEmpty {
                                    print("ManageNameSheet: Blank Space Baby")
                                } else {
                                    print("It is full")
                                    let newUserInfo = UserInfo(
                                        userName: userName)
                                    modelContext.insert(newUserInfo)
                                    dismiss()
                                }
                            } label: {
                                Text("Save")
                                    .frame(maxWidth: .infinity)
                            }
                            .padding(.top, 20)
                            .buttonStyle(.borderedProminent)
                            .tint(.mint)
                        }
                    }
                    .padding(.horizontal, 5.0)
                    .padding(.vertical, 2.0)
                    Spacer()
                }

                //Form End

                Divider()
            }
            .padding(.top, 1.0)
            .padding(.bottom, 10.0)
            .padding(.horizontal, 15)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 0, y: 4)
        }
        .padding([.leading, .trailing], 16.0)

        //Push Up Spacer
        Spacer()
    }
}

#Preview {
    @Previewable @State var userName: String = "Billy Bob"
    ManageNameSheet(userName: $userName)
}
