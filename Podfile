# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
workspace "DinDinn"
use_frameworks!


target 'DinDinn' do
    project "DinDinn.project"
    # Comment the next line if you don't want to use dynamic frameworks
    pod "RxSwift", '~> 5.1.0'
    pod 'MBProgressHUD', '~> 1.2.0'
    
    target 'DinDinnTests' do
        inherit! :search_paths
        # Pods for testing
    end
    
    target 'DinDinnUITests' do
        # Pods for testing
    end
    
end

target 'DinDinnCore' do
    project "SubProjects/DinDinnCore/DinDinnCore.project"
    pod "RxSwift", '~> 5.1.0'
    pod "RxCocoa", '~> 5.1.0'
    pod 'Moya/RxSwift', '~> 14.0'
    pod 'Kingfisher', '~> 6.0'
    pod 'MBProgressHUD', '~> 1.2.0'

end

target 'DinDinnResources' do
    project "SubProjects/DinDinnResources/DinDinnResources.project"
    pod 'SwiftGen', '6.4.0'
    
end
