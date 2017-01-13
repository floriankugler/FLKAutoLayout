Pod::Spec.new do |s|
  s.name         = "FLKAutoLayout"
  s.version      = "1.0.1"
  s.platform     = :ios, '7.0'
  s.summary      = "UIView category which makes it easy to create layout constraints in code."
  s.description  = "A collection of UIView category methods to make it easy when creating layout constraints in code."
  s.homepage     = "https://github.com/floriankugler/FLKAutoLayout"
  s.license      = 'MIT'
  s.authors      = { "Florian Kugler" => "mail@floriankugler.com" }
  s.source       = { :git => "https://github.com/floriankugler/FLKAutoLayout.git", :tag => s.version.to_s }
  s.source_files = 'FLKAutoLayout/**/*'
  s.public_header_files   = 'FLKAutoLayout/*.h'
end
