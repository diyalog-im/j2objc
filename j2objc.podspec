#
# Be sure to run `pod lib lint j2objc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'j2objc'
  s.version          = '1.0.2'
  s.summary          = 'Google j2objc framework that customized for DiyalogEngine.'
  s.homepage         = 'https://github.com/diyalog-im/j2objc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diyalog' => 'diyalog-im@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/diyalog-im/j2objc.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.public_header_files = "j2objc/j2objc.framework/Headers/*.h"
  s.source_files     = "j2objc/j2objc/Headers/*.h"

  
  s.prepare_command = <<-CMD
      echo 'fetching j2objc.framework'
      curl -OL 'https://diyalog.im/app/pkgs/ios_frameworks/j2objc/1.0.2/j2objc.zip'
      rm -fr 'j2objc.framework'
      echo 'unzipping j2objc.framework'
      unzip -o -q j2objc.zip
      echo 'cleaning files'
      rm j2objc.zip
    CMD

  s.vendored_frameworks = 'j2objc.framework'

  s.xcconfig = {
     "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/j2objc",
     "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/j2objc"
	
  }
    
end
