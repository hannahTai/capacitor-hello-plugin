
  Pod::Spec.new do |s|
    s.name = 'CapacitorHelloToast'
    s.version = '0.0.1'
    s.summary = 'A simple custom toast capacitor plugin for the starter.'
    s.license = 'MIT'
    s.homepage = 'https://github.com/hannahTaiWork/capacitor-hello-plugin.git'
    s.author = 'Hannah'
    s.source = { :git => 'https://github.com/hannahTaiWork/capacitor-hello-plugin.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end