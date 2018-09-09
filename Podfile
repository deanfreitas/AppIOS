# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AppIOS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire', '~> 4.7'
  pod 'SwiftyJSON', '~> 4.0'
  # Pods for AppIOS

  target 'AppIOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AppIOSUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
      end
    end
  end
end
