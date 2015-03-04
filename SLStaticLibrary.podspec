Pod::Spec.new do |s|
  s.name     = 'SLStaticLibrary'
  s.version  = '1.0.6'
  s.license  = 'MIT'
  s.summary  = 'my custom static library for iOS.'
  s.homepage = 'https://github.com/SugarLSG/SLStaticLibrary'
  s.authors  = { 'sugar.lin' => '339426723@qq.com' }
  s.source   = { :git => 'https://github.com/SugarLSG/SLStaticLibrary.git', :tag => s.version, :submodules => true }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'

#  s.source_files = 'SLStaticLibrary/*.{h,m}'

  s.subspec 'Categories' do |ss|
    ss.source_files = 'SLStaticLibrary/Categories/*.{h,m}'
  end

  s.subspec 'Controllers' do |ss|
    ss.source_files = 'SLStaticLibrary/Controllers/*.{h,m}'
  end

  s.subspec 'Models' do |ss|
    ss.source_files = 'SLStaticLibrary/Models/*.{h,m}'
  end

  s.subspec 'Views' do |ss|
    ss.source_files = 'SLStaticLibrary/Views/*.{h,m}'
  end
end
