//
//  StackDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct StackDemo: View {
    var body: some View {
        VStack{
            VStack{
                Text("Text1")
                Text("Text2")
            }
            HStack{
                Text("Text1")
                Text("Text2")
            }
            ZStack{
                Text("Text1")
                Text("Text2")
            }
        }
    }
}

struct StackDemo_Previews: PreviewProvider {
    static var previews: some View {
        StackDemo()
    }
}
