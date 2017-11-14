
Pod::Spec.new do |s|
  s.name         = 'TTCGCDTool'
  s.version      = '1.0.1'
  s.license          = 'MIT'
  s.homepage     = 'https://github.com/zhizihuadeaitan/TTCGCDTool'
  s.author             = { 'Cindy' => '493761458@qq.com' }
  s.summary      = 'GCD面向对象封装'
  s.source       = { :git => 'https://github.com/zhizihuadeaitan/TTCGCDTool.git', :tag => '1.0.1' }
  s.source_files  = 'TTCGCDTool', 'TTCGCDTool/**/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '9.0'

end

