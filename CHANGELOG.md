# Installation
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

# Update

Run update
```
> pod update
```

## 1.0.1 (2017-10-22)

##### Enhancements

- Clean stream from BOM (Byte Order Mark)
   characters to prevent parsing errors
- Add support for attributes

##### Bug Fixes

- Implement LocalizedError protocol instead
  of just Error so description are available
