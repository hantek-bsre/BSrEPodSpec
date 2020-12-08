#
# Be sure to run `pod lib lint BSrESignModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BSrESignModule'
  s.version          = '1.0.1'
  s.summary          = 'Digital Signature and Enrollment Crypto Module on Swift Language'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Modul ini digunakan untuk pembangkitan CSR dan TTE pada dokumen PDF dengan menggunakan metode Centralized dan Decentralized
                       DESC

  s.homepage         = 'https://bsre.bssn.go.id'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hantek-bsre' => 'hantek.bsre@gmail.com' }
  s.source           = { :git => 'https://hantek-bsre@github.com/hantek-bsre/BSrESignModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  s.platform = :ios, '13.0'

  s.source_files = 'BSrESignModule/Classes/**/*.{h,m,swift}'
  s.dependency 'Alamofire', '~> 5.4'
  s.dependency 'PSPDFKit', '~> 10.0.3'
  s.dependency 'OpenSSL-Universal', '~> 1.1.171'
  
  # s.resource_bundles = {
  #   'Resources' => ['BSrESignModule/Assets/caBSrE.pem']
  # }
 


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
