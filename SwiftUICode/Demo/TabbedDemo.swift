//
//  TabbedDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct TabbedDemo: View {
    @State var selection = 1
    let bgColor: [Color] = [.red,.gray,.green,.pink,.yellow]
    var body: some View {
        TabView(selection: $selection) {
            ForEach(0 ..< self.bgColor.count){index in
                NavigationView {
                    RoundedRectangle(cornerRadius: 10)
                        .padding(20)
                        .foregroundColor(self.bgColor[index])
                        .navigationBarTitle("NavTitle\(index)",displayMode: .inline)
                }
                .tabItem{
                    Image(systemName: "moon")
                    Text("\(index)")
                }
            }
        }
    }
}

struct TabbedDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabbedDemo()
    }
}
