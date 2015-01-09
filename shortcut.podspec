#
# Be sure to run `pod lib lint shortcut.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "shortcut"
  s.version          = "0.1.0"
  s.summary          = "Unobtrusive URL routing for iOS"
  s.description      = <<-DESC
                       Shortcut is an attempt to bring URL-based routing to iOS in the least obtrusive way possible. It allows you to instantiate and present view controllers via string URLs **without configuring routing** and from **outside the app (deep link)**
                       DESC
  s.homepage         = "https://github.com/ChrisChares/shortcut"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Chris Chares" => "chris@chares.io", "Ryan Wedig" => "ryan@activewebsite.com" }
  s.source           = { :git => "https://github.com/chrischares/shortcut.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<chrischares>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'shortcut' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
