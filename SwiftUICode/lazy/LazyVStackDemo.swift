//
//  LazyVStackDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/15.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct VStackCell : View {
    let index : Int
    init(_ index:Int){
        self.index = index
        print("init - \(index)")
    }
    var body: some View {
        Text("\(index)").font(.largeTitle)
            .onAppear {
                print("onAppear - \(self.index)")
            }
            .onDisappear {
                print("onDisappear - \(self.index)")
            }
    }
}

struct LazyVStack<Content>: View where Content: View {
    let content:()->Content
    var body: some View {
          //Xcode12-SwiftUI2-iOS14
//        if #available(iOS14, *){
//            SwiftUI.LazyVStack(content:content)
//        }else{
            VStack(content:content)
                .frame(maxWidth:.infinity)
//        }
    }
}

struct LazyVStackDemo: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0..<30,content: VStackCell.init)
            }
        }
        .background(Color.pink)
    }
}

struct LazyVStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackDemo()
    }
}
