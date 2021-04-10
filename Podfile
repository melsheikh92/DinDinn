# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
use_modular_headers!
workspace "DinDinn"
#use_frameworks!

target 'DinDinn' do
    project "DinDinn.project"
    use_frameworks!
    # Comment the next line if you don't want to use dynamic frameworks
    pod "RxSwift", '~> 5.1.0'
    pod "RxCocoa", '~> 5.1.0'
    pod 'Alamofire'
    pod 'Moya/RxSwift', '~> 14.0'
    pod 'ProgressHUD'
    pod 'Kingfisher', '~> 6.0'

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
#    use_frameworks!
    pod "RxSwift", '~> 5.1.0'
    pod "RxCocoa", '~> 5.1.0'
    pod 'Moya/RxSwift', '~> 14.0'
    pod 'Kingfisher', '~> 6.0'
    pod 'ProgressHUD'

end

target 'DinDinnResources' do
    project "SubProjects/DinDinnResources/DinDinnResources.project"
    pod 'SwiftGen', '6.4.0'
    
end
