# XmlHero

![iOS](https://img.shields.io/badge/iOS-9.0%2B-orange.svg)
![Swift](https://img.shields.io/badge/Swift-4-orange.svg)
![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic)

XML engine for parsing and creation

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
- Can load XML files by file name, url or data
- Your block will be called once the XML is loaded
   or if there was an error
- Works in the background so your UI is not blocked
- Your block will be called in a background thread,
   bear that in mind before trying to edit the UI

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

Xml.object(fileName:"myFile.xml")
{ (xml:[String:Any]?, error:XmlError?) in

    print(xml?["colours"])
}
```

Create a XML file
```
var myObject:[String:Any] = [:]
myObject["colour"] = "red"

Xml.data(object:myObject)
{ (data:Data?, error:XmlError?) in

    // do something with data
}
```

# Demo
Clone or download this repo, it contains a Demo App

