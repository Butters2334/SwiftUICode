//
//  RefreshDemo.swift
//  WeiboDemo
//
//  Created by ac on 2020/12/15.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI
import SwiftUIPullToRefresh

struct RefreshNavDemo: View {
    @State var list: [Int] = (0..<10).map{$0}
    var body: some View {
        VStack{
            RefreshableNavigationView(title: "nav title", action: {
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    var arr1 = self.list
                    arr1.append(arr1[0])
                    arr1 = arr1[1..<arr1.endIndex].map{$0}
                    self.list = arr1
                }
            }) {
                ForEach(self.list, id: \.self){ i in
                    Text("Text \(i)")
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(i%2==0 ? Color(UIColor.green) : Color.green)
                }
            }
        }
    }
}

struct RefreshNavDemo_Previews: PreviewProvider {
    static var previews: some View {
        RefreshNavDemo()
    }
}
