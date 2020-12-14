//
//  SDImgeDemo.swift
//  WeiboDemo
//
//  Created by ac on 2020/12/8.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDImgeDemo: View {
    @State private var url : URL?
    @State private var loading:Bool = false
    @State private var state : String = ""
    var body: some View {
        return VStack{
            WebImage(url: url,isAnimating:$loading)
                .placeholder{ Color.gray }
                .resizable()
                .onSuccess(perform: { _ in
                    self.state = "success"
                })
                .onFailure(perform: { _ in
                    self.state = "failure"
                })
                .scaledToFill()
                .clipped()
                .frame(height:300)
            Button(action: {
                self.url = self.url != nil ? nil : URL(string: "https://img.alicdn.com/tfs/TB1_uT8a5ERMeJjSspiXXbZLFXa-143-59.png")
            }) {
                Text("down SDImage")
            }
            Text("state = \(state)")
        }
    }
}


struct SDImgeDemo_Previews: PreviewProvider {
    static var previews: some View {
        SDImgeDemo()
    }
}
