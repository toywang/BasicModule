#
# Be sure to run `pod lib lint TYBasicModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TYBasicModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TYBasicModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/toywang/TYBasicModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'toywang' => '1002392634@qq.com' }
  s.source           = { :git => 'https://github.com/toywang/TYBasicModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TYBasicModule/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TYBasicModule' => ['TYBasicModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
   s.dependency 'AFNetworking', '~> 3.2.1'
   s.dependency 'YYCache','~> 1.0.4'
   s.dependency 'XHToast', '~> 1.4.0'
   s.dependency 'SVProgressHUD', '~> 2.2.5'
   s.dependency 'MBProgressHUD', '~> 1.1.0'
   s.dependency 'JKCategories' , '~> 1.7'

end
















