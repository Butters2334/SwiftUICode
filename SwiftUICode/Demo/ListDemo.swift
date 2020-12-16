//
//  ListDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct ListDemo: View {
    let maxWidth = UIScreen.main.bounds.width
    let maxHeight = UIScreen.main.bounds.height
    var body: some View {
        HStack{
            List{
                ForEach(0..<10){
                    Text("ForEach = \($0)")
                }
            }
            .frame(width:maxWidth/2)
            List(0..<10){
                    Text("List = \($0)")
            }
            .frame(width:maxWidth/2)
        }.frame(width:maxWidth)
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
