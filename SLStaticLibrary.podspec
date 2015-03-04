Pod::Spec.new do |s|
  s.name     = "SLStaticLibrary"
  s.version  = "1.0.3"
  s.license  = "MIT"
  s.summary  = "my custom static library for iOS."
  s.homepage = "https://github.com/SugarLSG/SLStaticLibrary"
  s.authors  = { "sugar.lin" => "339426723@qq.com" }
  s.source   = { :git => "https://github.com/SugarLSG/SLStaticLibrary.git", :tag => s.version }
  s.source_files = "SLStaticLibrary/Categories/*", "SLStaticLibrary/Models/*", "SLStaticLibrary/Controllers/*"
  s.platform = :ios, "7.0"
  s.requires_arc = true
end
