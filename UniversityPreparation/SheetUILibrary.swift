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
                    .foregroundStyle(Color.accent)
                    .controlSize(.extraLarge)
                Text(backNavLinkName)
                    .font(.title3).fontWeight(.light)
                    .foregroundColor(.accent)
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
                    .foregroundColor(.contrastFG)
                Spacer()
            }
        }
    }
}

struct CustomDivider: View {
    
    let color: Color = .milderFG
    let height: CGFloat = 0.5
    
    var body: some View {
        color
            .frame(height: height)
    }
}

struct StandardTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .font(.headline)
            .fontWeight(.light)
            .padding(.leading, 10.0)
            .padding([.leading, .bottom, .top], 5.0)
            .autocorrectionDisabled(true)
            .background(RoundedRectangle(cornerRadius: 3).fill(.milderFG.opacity(0.3)).strokeBorder(.milderFG.opacity(0.0),lineWidth: 5))
    }
    
    //.textFieldStyle(StandardTextFieldStyle())
}


#Preview {
    Text("Go preview something else, Idiot!")
    Text("This is a UILibary")

}
