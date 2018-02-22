Pod::Spec.new do |s|
  s.name                  = 'XibKit'
  s.version               = '2.0.0'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.summary               = 'Simple XibKit'
  s.description           = 'The '
  s.homepage              = 'https://github.com/Kreitech/XibKit'
  s.authors               = {  }
  s.source                = { :git => 'https://github.com/Kreitech/XibKit.git',
                              :tag => s.version.to_s }
  s.requires_arc          = true
  s.source_files          = ['XibKit/*.{h,m}']
  s.framework             = 'AVFoundation'
  s.ios.deployment_target = '7.0'
end
