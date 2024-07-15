# RackNonceMiddleware

A Rack middleware to add a nonce to the CSP header and expose it to the view templates.

This is a minimalistic gem to help with Rack applications (such as Sinatra) that need a CSP policy for inline scripts and styles. This middleware generates a nonce for each request, adds it to the CSP header, and exposes it to the application views as `env['csp.nonce']` so that it can be included in the script and style tags.

## Usage

Add the hem to your Gemfile:

```
gem 'rack_nonce_middleware'
```

In your backend Rack application, add the middleware to the stack:

```ruby
require 'rack-nonce-middleware'

use RackNonceMiddleware # Make sure this is included before Rack::Protection

use(Rack::Protection, {
  use: %i[content_security_policy],
  script_src: "'self' '#{RackNonceMiddleware::NONCE}' https://....",
  style_src: "'self' '#{RackNonceMiddleware::NONCE}' https://....",
```

In your views, add the nonce to the script and style tags:

```erb
<script nonce="<%= env['csp.nonce'] %>">...</script>
<style nonce="<%= env['csp.nonce'] %>">...</style>
```