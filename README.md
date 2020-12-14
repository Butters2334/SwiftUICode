# SwiftUICode
some SwiftUI code
收集一些在开发中遇到的常用SwiftUI方案
不会有SwiftUI2.0的代码,因为2020年才发布,等待用户升级到iOS14需要又一年时间;所以本项目只收集Swift1.0正式版遇到的一些问题,并尽量给出解决方案

## 💻 所需环境

- macOS 11.0.1beta
- Xcode 11.0
- iOS 13.0


## 📂 目录：
- [不可设置placeholder样式](#placeholder)





<h4 id="placeholder">不可设置placeholder样式</h4>
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
* 使用ViewModifier比较简洁,[Placeholder](/placeholder/PlaceholderSolution.swift)
2.使用[第三方框架](https://github.com/siteline/SwiftUI-Introspect)找到`uiTextField`对象后设置`attributedPlaceholder`

