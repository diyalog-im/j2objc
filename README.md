# j2objc

[![CI Status](https://img.shields.io/travis/tcak76/j2objc.svg?style=flat)](https://travis-ci.org/tcak76/j2objc)
[![Version](https://img.shields.io/cocoapods/v/j2objc.svg?style=flat)](https://cocoapods.org/pods/j2objc)
[![License](https://img.shields.io/cocoapods/l/j2objc.svg?style=flat)](https://cocoapods.org/pods/j2objc)
[![Platform](https://img.shields.io/cocoapods/p/j2objc.svg?style=flat)](https://cocoapods.org/pods/j2objc)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

To install it, simply add the following line to your Podfile by updating \<version no> to the desired version.

```ruby
pod 'j2objc', :git => 'https://github.com/diyalog-im/j2objc.git', :tag => '<version no>'
```

j2objc is needed only to compile DiyalogEngine. You should add j2objc to framework and header search paths in your projects build settings. Also, you should not build the j2objc, therefore you must remove it from other linker flags. For doing this you can add following post_install step in to your podfile. Please do not forget to replace the \<TargetName> with your project target name.

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "Pods-<TargetName>"
      target.build_configurations.each do |config|
      	xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig.sub!('-framework "j2objc"', '')
        File.open(xcconfig_path, "w") do |file|
           file << xcconfig
        end
      end
    end
  end
end
```


## Author

Diyalog Yazılım Teknolojileri Ltd. Şti.

## License

j2objc is available under the MIT license. See the LICENSE file for more info.
