# XmlHero

![iOS](https://img.shields.io/badge/iOS-9.0%2B-orange.svg)
![Swift](https://img.shields.io/badge/Swift-4-orange.svg)
![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic)

XML engine

# Install
### CocoaPods
You can get XmlHero easily with CocoaPods.

Add to your Podfile
```
pod 'XmlHero'
```
Run installation
```
> pod install
```
If you are wondering what is CocoaPods take a look at: [https://cocoapods.org](https://cocoapods.org)

# Usage
### Xml
Xml is the class you need to use for XML parsing

### Add XmlHero
Once the Pod is installed import it in your project
```
import XmlHero
```

Parse a XML file
```
// myFile.xml

<?xml version="1.0" encoding="utf-8"?>
<colours>
    <red>#FF0000</red>
</colours>
```

```
// your project

Xml.object(
    fileName:"myFile.xml",
    bundle:nil)
{ (xml:[String:Any]?, error:XmlError?) in

    print(xml?["colours"])
}
```

# Demo
Clone or download this repo, it contains a Demo App

