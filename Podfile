# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FoodDelivery' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FoodDelivery
  pod 'SnapKit'
  
  pod 'Moya', '~> 15.0'
  pod 'Moya/Combine', '~> 15.0'

  pod 'GoogleMaps'
  
  pod 'R.swift'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
