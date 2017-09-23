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

## 1.1.0 (2017-10-22)

##### Enhancements

- Add building XML from an object
- Clean stream from BOM (Byte Order Mark)
   characters to prevent parsing errors
- Add support for attributes
- Explicitly return a dictionary
   Instead of just returning Any
- Remove file extension parameter on factory
   and receive full file name on same parameter


##### Bug Fixes

- Implement LocalizedError protocol instead
  of just Error so descriptions are available
  
  
  ## 1.1.1 (2017-10-23)
  
  ##### Enhancements
  
  - None
  
  
  ##### Bug Fixes
  
  - Parse arrays in XML files
