source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'

target 'imgurJuan' do
	use_frameworks!
	pod 'SDWebImage'
        pod 'INSPhotoGallery'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
