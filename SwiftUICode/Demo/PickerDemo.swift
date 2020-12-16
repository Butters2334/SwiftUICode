//
//  PickerDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct PickerDemo: View {
    let maxWidth = UIScreen.main.bounds.width
    let maxHeight = UIScreen.main.bounds.height
    @State var selection = 3
    @State var dateSelect = Date()
    var body: some View {
        VStack{
            Text("selection = \(selection)")
            Picker("Picker", selection: $selection, content: {
                ForEach(0..<10){ i in
                    Text("\(i) - 🐓")
                }
            })
            Text("date = \(dateSelect)")
            DatePicker("DatePicker", selection: $dateSelect)
//            DatePicker("DatePicker",selection: $dateSelect, label: {
//                ForEach(0..<10){ i in
//                    Text("\(i) - 🐓")
//                }
//            })
        }
    }
}

struct PickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemo()
    }
}
