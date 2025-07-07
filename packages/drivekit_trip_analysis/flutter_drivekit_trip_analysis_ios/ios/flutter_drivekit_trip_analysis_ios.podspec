#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_drivekit_trip_analysis_ios'
  s.version          = '1.6.0'
  s.summary          = 'An iOS implementation of the drivekit_trip_analysis plugin.'
  s.description      = <<-DESC
  An iOS implementation of the drivekit_trip_analysis plugin.
                       DESC
  s.homepage         = 'https://docs.drivequant.com'
  s.license          = { :type => 'Apache-2.0', :file => '../LICENSE' }
  s.author           = { 'DriveQuant' => 'developer@drivequant.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'DriveKitTripAnalysis', '2.17.1'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
