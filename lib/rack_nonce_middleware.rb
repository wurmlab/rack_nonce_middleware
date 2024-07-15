class RackNonceMiddleware
  NONCE = 'nonce-NONCE-VALUE'.freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    nonce = SecureRandom.alphanumeric(16)
    env['csp.nonce'] = nonce
    status, headers, response = @app.call(env)

    if headers['Content-Security-Policy']
      headers['Content-Security-Policy'] = headers['Content-Security-Policy'].gsub(NONCE, "nonce-#{nonce}")
    end

    [status, headers, response]
  end
end