#
# Be sure to run `pod lib lint LSDialogViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LSDialogViewController"
  s.version          = "0.1.1"
  s.summary          = "This ViewController is able to easily display a custom view as a dialog."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
You can easily display a dialog that has a variety of effects Using this library.
                       DESC

  s.homepage         = "https://github.com/daihase/LSDialogViewController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "daihase" => "daisuke_hasegawa@librastudio.co.jp" }
  s.source           = { :git => "https://github.com/daihase/LSDialogViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/librakinoko'
  s.ios.deployment_target = '8.0'
  s.source_files = 'LSDialogViewController/Classes/**/*'
end
