//
//  ScrollViewDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        ScrollView{
            ForEach(0..<100){
                Text("index = \($0)")
            }
            .frame(maxWidth:.infinity)
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}
