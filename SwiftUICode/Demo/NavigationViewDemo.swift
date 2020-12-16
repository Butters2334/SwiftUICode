//
//  NavigationViewDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct NavigationViewDemo: View {
    var body: some View {
        NavigationView {
            List(0..<30){i in
                HStack{
                    Image(systemName: "sun.max")
                        .font(.system(size: 60))
                    .blur(radius: 4)
                    Text("🐶")
                        .font(.system(size: 90))
                    .blur(radius: 2)
                    Image(systemName: "moon")
                        .font(.system(size: 70))
                    .blur(radius: 4)
                }
            }
                .navigationBarTitle(Text("NavTitle"),displayMode: .automatic)
                .navigationBarItems(leading:Text("leading"),trailing:Text("trailing"))
        }
    }
}

struct NavigationViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewDemo()
    }
}
