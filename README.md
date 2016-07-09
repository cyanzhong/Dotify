# Dotify
![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

Convert `[[AnObject method1] method2]` to `AnObject.method1.method2` with [Xcode Extension](https://developer.apple.com/videos/play/wwdc2016/414/)

# Editor Menu
![image](https://raw.githubusercontent.com/cyanzhong/Dotify/master/GIFs/menu.gif)
![image](https://raw.githubusercontent.com/cyanzhong/Dotify/master/GIFs/setter.gif)

# Set Xcode Key-Binding
![image](https://raw.githubusercontent.com/cyanzhong/Dotify/master/GIFs/key-binding.gif)

# Use Shortcut
![image](https://raw.githubusercontent.com/cyanzhong/Dotify/master/GIFs/shortcut.gif)

# What is it
[xTextHandler](https://github.com/cyanzhong/xTextHandler) based tool to convert Objective-C syntax

# Features
- `[[AnObject method1] method2]` -> `AnObject.method1.method2`
- `[self setAlpha:0.5]` -> `self.alpha = 0.5`
- Multiline Selections
- Key-Binding available
- Swift 3.0

# Usage
1. Install Xcode 8
2. `sudo /usr/libexec/xpccachectl` in macOS EI Capitan
3. Build & Run
4. Choose Xcode to debug
5. Select text
6. Open Editor menu to find extensions
7. You can set a shortcut (Key-Binding) for each extension
8. Maybe you will like this [WWDC Session](https://developer.apple.com/videos/play/wwdc2016/414/)

# Tips
Since Xcode 8.0 beta 2 (8S162m) is totally unstable now, you may see nothing after you build & run this project :(

# Contacts
Weibo: [@StackOverflowError](http://weibo.com/0x00eeee/)

Twitter: [@cyanapps](https://twitter.com/cyanapps)

Email: [log.e@qq.com](mailto:log.e@qq.com)
