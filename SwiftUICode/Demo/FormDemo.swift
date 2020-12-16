//
//  FormDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct FormDemo: View {
    @State var name:String = ""
    @State var pwd:String = ""
    var body: some View {
        Form{
            TextField("name", text: $name)
            SecureField("pwd", text: $pwd)
        }
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}
