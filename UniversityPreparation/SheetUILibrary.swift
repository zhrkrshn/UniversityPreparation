//
//  SheetUILibrary.swift
//  UniversityPreparation
//
//  Created by Zohar Krishna on 2024-11-17.
//
import SwiftUI

struct setupSheetBackLinkNav: View {

    var backNavLinkName: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.mint)
                    .controlSize(.extraLarge)
                Text(backNavLinkName)
                    .font(.title3).fontWeight(.light)
                    .foregroundColor(.mint)
                Spacer()
            }
        }
        .padding([.leading, .trailing], 16)
        .padding([.top, .bottom], 10)
        .onTapGesture {
            //save and ?
            dismiss()
        }
    }
}
struct setupSheetTitle: View {
    var titleString: String

    var body: some View {
        VStack {
            HStack {  //Welcome HStack
                Text(titleString)
                    .font(.title)
                    .fontWeight(.light).padding(.leading, 20)
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}

#Preview {
    Text("Go preview something else, Idiot!")
    Text("This is a UILibary")

}
