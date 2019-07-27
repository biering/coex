Pod::Spec.new do |s|
  s.name        = "Coex"
  s.version     = "1.0.0"
  s.summary     = "A lightweight Swift library & syntactic sugar for async (GCD) operations"
  s.homepage    = "https://github.com/chryb/coex"
  s.license     = { :type => "MIT" }
  s.authors     = { "Christoph Biering" => "chryb.q@gmail.com" }

  s.osx.deployment_target = "10.10"
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "3.0"
  s.source   = { :git => "https://github.com/chryb/coex.git", :tag => "1.0.0"}
  s.source_files = "Sources/**/*.swift"
  s.requires_arc = true
  s.module_name = 'Coex'
end
