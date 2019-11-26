source 'ssh://git@codereview.technologies.fabernovel.com:29418/CocoaPodsSpecs'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
use_frameworks!

pod 'CocoaLumberjack/Swift', '~>  3.5', :inhibit_warnings => true
pod 'ADDynamicLogLevel', '~>  2.1', :inhibit_warnings => true
pod 'Swinject', '~> 2.4'
pod 'SwiftLint', '~> 0.35'
pod 'SwiftGen', '~> 6.0'

target 'CombineTest' do
  pod 'Alamofire', '~> 4.8'
  pod 'HockeySDK', '~> 5.1', :subspecs => ['CrashOnlyLib']
  pod 'Watchdog', '~> 5.1'
  pod 'ADUtils', '~> 10'
  pod 'DBDebugToolkit', '~> 0.5', :configurations => ['Stubs', 'Preproduction']
end

target 'CombineTestTests' do
  pod 'ADLayoutTest', '~> 0.1'
  pod 'SwiftCheck', '~> 0.12'
  pod 'SnapshotTesting', '~> 1.5'
  pod 'OCMock', '~> 3.4'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      # Change the Optimization level for each target/configuration
      if !config.name.include?("Distribution")
        config.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = "-Onone"
        config.build_settings['COPY_PHASE_STRIP'] = "NO"
      end

      # Disable Pod Codesign
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end
