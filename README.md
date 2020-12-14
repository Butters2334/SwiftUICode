<img src="https://github.com/Butters2334/SwiftUICode/blob/main/images/banner.png"/>

[![Build Status](https://img.shields.io/badge/platforms-iOS%20%7C%20tvOS%20%7C%20macOS%20%7C%20watchOS-green.svg)](https://github.com/butters2334/SwiftUICode)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11.0-blue.svg)](https://developer.apple.com/xcode)
[![Xcode](https://img.shields.io/badge/macOS-15.0-blue.svg)](https://developer.apple.com/macOS)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)

- 收集一些在开发中遇到的SwiftUI方案
- 不会有SwiftUI2.0/WWDC2020的代码,因为2020年才发布,等待用户升级到iOS14需要更长时间;所以本项目只收集Swift1.0正式版遇到的一些问题,并尽量给出解决方案

## 💻 所需环境

- macOS 10.5.0
- Xcode 11.0
- iOS 13.0


## 📂 目录：
- [Xcode12](#xcode12)
- [PageView](#pageview)
- [不可设置placeholder样式](#placeholder)
- [下划线样式](#underline)
- [下拉刷新/上拉加载]()
- [WebImage](webimage)


<h2 id="xcode12">Xcode12</h2>

Xcode12的全新特性@main代表了SwiftUI的完全体,但是最低iOS14支持也意味着至少要用一年时间
老老实实用UIHostingViewController来封装吧



<h2 id="pageview">PageView</h2>

UIScrollView的isPagingEnabled在swiftUI上没有对应实现,需要分页显示的需求可以使用`UIViewControllerRepresentable`或`UIViewRepresentable`来调用UIKit的功能进行封装

>关于封装UIkit在油管找到个教学视频,跟着写不难理解 - [BBCo教学](https://www.youtube.com/watch?v=Gpxs3q5Wy84&t=1135s)

>使用封装好的[HScrollViewController](/SwiftUICode/pageview/HScrollViewController.swift)可以很轻松实现[左右滑动的效果](/SwiftUICode/pageview/PageViewSolution.swift)


<h2 id="placeholder">不可设置placeholder样式</h2>

SwiftUI早期placeholder可以直接传入Text自定义样式,但是后期修正了这个特性

```swift
//before
TextField(.constant(""), placeholder: Text("请填入昵称"))
```
```swift
//after
TextField("请填入昵称", text: .constant(""))
```
这意味着placeholder在官方API中不能再修改样式

在[stackoverflow.com](https://stackoverflow.com/questions/57688242/swiftui-how-to-change-the-placeholder-color-of-the-textfield/61041398#61041398)找到两种解决方案:

1. ZStack放一个Text在TextField下面,根据$text显示/隐藏
>[最后使用ViewModifier封装](/SwiftUICode/placeholder/PlaceholderSolution.swift)
>
    ```
    struct PlaceHolder<T: View>: ViewModifier {
        var placeHolder: T
        var show: Bool
        func body(content: Content) -> some View {
            ZStack(alignment: .leading) {
                if show { placeHolder }
                content
            }
        }
    }
    ```
    ```swift
    //solution
    TextField("",text: $text)
    .modifier(PlaceHolder(placeHolder: Text("请填入昵称"), show: text.isEmpty))
    ```

2. 使用[第三方框架](https://github.com/siteline/SwiftUI-Introspect)找到`uiTextField`对象后设置`attributedPlaceholder`
>但是这个框架目前在维护状态...


<h2 id="underline">下划线样式</h2>
Text可以调用underline设置下划线,但是只能设置Color

>
```swift
Text("标准下划线").underline()
Text("标准下划线设置颜色").underline(true, color: .red)
Text("标准下划线隐藏").underline(false)
```

提出问题的人不多,可能是因为比较容易处理
>
```swift
//StrokeStyle设置为虚线
//alignments设置为在原先view的下面
//offset定义间距
Text("自定义样式")
    .overlay(
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .offset(y: 4)
                .foregroundColor(.blue)
    , alignment: .bottom)
```

<h2 id="webimage">WebImage</h2>
多年的老问题,官方api中不能直接使用image-url给Image赋值,需要额外编写不少的代码

>[不使用第三方](/SwiftUICode/WebImage/SimpleImageDemo.swift)的情况下,可以使用Data(contentsOf: url)下载image.data,之后刷新页面赋值

>第三方[SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI),本地集成之后,使用WebImage来代替Image[实现](/SwiftUICode/WebImage/SDImgeDemo.swift)

>第三方[Kingfisher](https://github.com/onevcat/Kingfisher),本地集成之后,使用KFImage来代替Image实现


## 📎 About

* 以上示例中所涉及代码，针对于SwiftUI1.0系统API,部分问题在SwiftUI2.0中已经被修复。
* 如果有遇到 SwiftUI 的其他痛点,请联系邮箱或提出[**Issue**](https://github.com/Butters2334/SwiftUICode/issues/new) !
* 如果本文示例内容有疏漏和错误之处，欢迎提 [**Issue**](https://github.com/Butters2334/SwiftUICode/issues/new) ！



## ✉️ Contacts

email : mahuajian@gmail.com


## 📄 License	

SwiftUI is released under the [MIT license](LICENSE). See LICENSE for details.

