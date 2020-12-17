//
//  ActionDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct ActionDemo: View {
    @State var pop = false
    var body: some View {
        VStack{
            AlertButton(Text("show alert").setButtonStyle(), title: Text("title"), message: Text("Message"), buttons: [
                        .cancel(Text("取消")),
                        .destructive(Text("警告样式"))
            ])
            
            ActionSheetButton(Text("show action").setButtonStyle(),
                              title: Text("title"),
                              message: Text("message"),
                              buttons: [
                                  .default(Text("默认样式"), action: {
                                      print("default")
                                  }),
                                  .destructive(Text("警告样式"), action: {
                                      print("destructive")
                                  }),
                                  .cancel(Text("关闭样式"), action: {
                                      print("cancel")
                                  })
                              ])
            
            SheetButton(Text("show modalView").setButtonStyle()) {
                Text("modalView")
                    .bold()
                    .font(.system(size: 50))
            }
            
            Button(action: {
                self.pop = true
            }) {
                Text("Pop").setButtonStyle()
            }.popover(isPresented: $pop) {
                Text("popView")
                    .bold()
                    .font(.system(size: 50))
            }
        }
    }
}

struct AlertButton: View{
    let buttonLabel:Text
    let title: Text
    var message: Text? = nil
    var buttons: [Alert.Button] = [.cancel()]
    init(_ label:Text,title:Text,message:Text?=nil,buttons: [ActionSheet.Button] = [.cancel()]) {
        self.buttonLabel = label
        self.title = title
        self.message = message
        self.buttons = buttons
    }
    @State private var isPresented = false
    var body: some View{
        Button(action: {
            self.isPresented = true
        },label:{buttonLabel})
            .alert(isPresented: $isPresented){
                if buttons.count >= 2 {
                    return Alert(
                                title:title,
                                message:message,
                                primaryButton: buttons[0],
                                secondaryButton: buttons[1])
                }else{
                    return Alert(
                                title:title,
                                message:message,
                                dismissButton: buttons[0])
                }
        }
    }
}


struct ActionSheetButton: View{
    let buttonLabel:Text
    let title: Text
    var message: Text? = nil
    var buttons: [ActionSheet.Button] = [.cancel()]
    init(_ label:Text,title:Text,message:Text?=nil,buttons: [ActionSheet.Button] = [.cancel()]) {
        self.buttonLabel = label
        self.title = title
        self.message = message
        self.buttons = buttons
    }
    @State private var isPresented = false
    var body: some View{
        Button(action: {
            self.isPresented = true
        },label:{buttonLabel})
            .actionSheet(isPresented: $isPresented){
                ActionSheet(title:title, message:message, buttons:buttons)
        }
    }
}

struct SheetButton<Content>: View where Content : View{
    let label:Text
    let content:()->Content
    init(_ label:Text,content:@escaping ()->Content) {
        self.label = label
        self.content = content
    }
    @State private var isPresented = false
    var body: some View{
        Button(action: {
            self.isPresented = true
        },label:{label})
        .sheet(isPresented: $isPresented,
               content: self.content)
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
