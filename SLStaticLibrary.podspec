Pod::Spec.new do |s|
  s.name     = 'SLStaticLibrary'
  s.version  = '1.0.10'
  s.license  = 'MIT'
  s.summary  = 'my custom static library for iOS.'
  s.homepage = 'https://github.com/SugarLSG/SLStaticLibrary'
  s.authors  = { 'sugar.lin' => '339426723@qq.com' }
  s.source   = { :git => 'https://github.com/SugarLSG/SLStaticLibrary.git', :tag => s.version, :submodules => true }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'

  #s.public_header_files = 'SLStaticLibrary/*.h'
  #s.source_files = 'SLStaticLibrary/*.{h,m}'

  s.subspec 'Bundles' do |ss|
    ss.source_files = 'SLStaticLibrary/Bundles/**/*'
    ss.public_header_files = 'SLStaticLibrary/Bundles/**/*.h'
  end

  s.subspec 'Categories' do |ss|
    ss.source_files = 'SLStaticLibrary/Categories/**/*'
    ss.public_header_files = 'SLStaticLibrary/Categories/**/*.h'
  end

  s.subspec 'Commons' do |ss|
    ss.source_files = 'SLStaticLibrary/Commons/**/*'
    ss.public_header_files = 'SLStaticLibrary/Commons/**/*.h'
    ss.dependency 'SLStaticLibrary/Categories'
    ss.dependency 'AFNetworking'
    ss.dependency 'SDWebImage'
  end

  s.subspec 'Controllers' do |ss|
    ss.source_files = 'SLStaticLibrary/Controllers/**/*'
    ss.public_header_files = 'SLStaticLibrary/Controllers/**/*.h'
    ss.dependency 'SLStaticLibrary/Commons'
  end

  s.subspec 'Models' do |ss|
    ss.source_files = 'SLStaticLibrary/Models/**/*'
    ss.public_header_files = 'SLStaticLibrary/Models/**/*.h'
  end

  s.subspec 'Views' do |ss|
    ss.source_files = 'SLStaticLibrary/Views/**/*'
    ss.public_header_files = 'SLStaticLibrary/Views/**/*.h'
    ss.dependency 'SLStaticLibrary/Commons'
  end
end
