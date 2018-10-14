Pod::Spec.new do |spec|
	spec.name         = 'LSDialogViewController'
	spec.version      = '3.1'
	spec.license      = 'MIT'
	spec.homepage     = 'https://github.com/daihase/LSDialogViewController'
	spec.authors      = { 'daihase' => 'daisuke_hasegawa@librastudio.co.jp' }
	spec.summary      = 'This ViewController is able to easily display a custom view as a dialog.'
	spec.source       = { :git => 'https://github.com/daihase/LSDialogViewController.git', :tag => spec.version.to_s }
	spec.swift_version = '4.2'
	spec.ios.deployment_target = '9.2'
	spec.source_files = 'LSDialogViewController/Classes/**/*'
end
