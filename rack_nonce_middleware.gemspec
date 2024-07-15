Gem::Specification.new do |s|
  s.name        = "rack_nonce_middleware"
  s.version     = "0.0.2"
  s.summary     = "A Rack middleware for adding a CSP nonce to requests"
  s.description = "A Rack middleware to add a nonce to the CSP header and expose it to the view templates"
  s.authors     = ["Tadas Tamosauskas, Pragmatic Genomics Ltd"]
  s.email       = "contact@sequenceserver.com"
  s.files       = ["lib/rack_nonce_middleware.rb"]
  s.homepage    =
    "https://rubygems.org/gems/rack_nonce_middleware"
  s.license       = "MIT"
end