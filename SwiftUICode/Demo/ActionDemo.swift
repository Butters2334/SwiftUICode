//
//  ActionDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct ActionDemo: View {
    @State var showAlert = false
    @State var showActionSheet = false
    @State var showModalView = false
    @State var showPop = false
    func label(_ text:String)->() -> Text{
        {
            Text(text).setButtonStyle()
        }
    }
    var body: some View {
        VStack{
            Button(action: {
                self.showAlert = true
            },label: label("show alert"))
            .alert(isPresented: $showAlert){
                AlertView.show()
            }
            
            Button(action: {
                self.showActionSheet = true
            }) {
                Text("show action").setButtonStyle()
           }.actionSheet(isPresented: $showActionSheet) {
                ActionSheetView.show()
            }
            
            Button(action: {
                self.showModalView = true
            }) {
                Text("show modalView").setButtonStyle()
            }.sheet(isPresented: $showModalView) {
                ModalView()
            }
            
//            ActionButton{
//                Text("ActionButton").setButtonStyle()
//            }
//            .showActionSheet {
//                ModalView()
//            }
        }
    }
}

struct ActionButton<ActionView>: View where ActionView:View{
    let label:()->Text
    @State var isPresented = false
    var body: some View{
        Button(action: {
            self.isPresented = true
        },label:label)
        .sheet(isPresented: $isPresented){
                ModalView()
        }
    }
    func showActionSheet(_ action:@escaping ()->ActionView)->some View{
        self.sheet(isPresented: $isPresented,content: {ModalView()})
    }
}

extension Text{
    func setButtonStyle()->Text{
        self
            .foregroundColor(.randomColor)
            .bold()
            .font(.system(size:50))
    }
}

struct AlertView {
    static func show()->Alert{
        Alert(
            title:Text("title"),
            message:Text("message"),
            primaryButton: .default(Text("default")),
            secondaryButton: .cancel())
    }
}
struct ActionSheetView {
    static func show()->ActionSheet{
        ActionSheet(title: Text("title"), message: Text("message"), buttons: [
            .default(Text("default"), action: {
                print("default")
            }),
            .destructive(Text("destructive"), action: {
                print("destructive")
            }),
            .cancel(Text("cancel"), action: {
                print("cancel")
            })
        ])
    }
}

struct ModalView: View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("dissmiss")
                .bold()
                .font(.system(size: 50))
        }
    }
}

struct ActionDemo_Previews: PreviewProvider {
    static var previews: some View {
        ActionDemo()
    }
}
