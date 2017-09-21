Pod::Spec.new do |s|
    s.name             = 'XmlHero'
    s.version          = '1.0.0'
    s.summary          = 'XML Parser'
    s.description      = <<-DESC
                                Parse XML documents.
                            DESC
    s.homepage         = 'https://github.com/iturb/xmlhero'
    s.license          = { :type => "MIT", :file => "LICENSE" }
    s.author           = { 'iturbide' => 'reach@iturbi.de' }
    s.platform         = :ios, '9.0'
    s.source           = { :git => 'https://github.com/iturb/xmlhero.git', :tag => "v#{s.version}" }
    s.source_files     = 'Source/**/*.swift'
    s.resources        = 'Resources/**/*'
end
