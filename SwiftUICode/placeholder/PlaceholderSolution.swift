//
//  PlaceholderSolution.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/14.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct PlaceHolder<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show { placeHolder }
            content
        }
    }
}

struct PlaceholderSolution: View {
    @State var text:String = ""
    let nameText = Text("请填入昵称")
        .foregroundColor(.green)
        .font(.system(size: 16))
    var body: some View {
        VStack{
            //before
            //TextField($text, placeholder: nameText)
            //after
            //TextField("请填入昵称", text:$text)
            //solution
            TextField("",text: $text)
                .modifier(PlaceHolder(placeHolder: nameText, show: text.isEmpty))
        }
        .padding(.leading,30)
        .padding(.trailing,30)
    }
}

struct PlaceholderSolution_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderSolution()
    }
}
