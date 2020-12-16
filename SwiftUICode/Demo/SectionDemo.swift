//
//  SectionDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct SectionDemo: View {
    var body: some View {
        List{
            Section(header: Text("header"), footer: Text("footer")) {
                ForEach(0..<10){
                    Text("index = \($0)").foregroundColor(Color(.gray))
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct SectionDemo_Previews: PreviewProvider {
    static var previews: some View {
        SectionDemo()
    }
}
