require 'json'

# Root-level podspec so this repo can be consumed directly as an npm git
# dependency (github:butlergreece/capacitor-google-maps#7.x): Capacitor CLI
# generates `pod ..., :path => node_modules/@capacitor/google-maps` (the package
# root), and CocoaPods requires the podspec to live exactly there. Mirrors
# plugin/CapacitorGoogleMaps.podspec with plugin/-prefixed source paths.
package = JSON.parse(File.read(File.join(__dir__, 'plugin/package.json')))

Pod::Spec.new do |s|
  s.name = 'CapacitorGoogleMaps'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']
  s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
  s.source_files = 'plugin/ios/Sources/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.ios.deployment_target  = '14.0'
  s.dependency 'Capacitor'
  s.dependency 'GoogleMaps', '~> 8.4'
  s.dependency 'Google-Maps-iOS-Utils', '~> 5.0'
  s.swift_version = '5.1'
  s.static_framework = true
end
