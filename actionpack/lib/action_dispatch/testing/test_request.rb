module ActionDispatch
  class TestRequest < Request
    def self.new(env = {})
      super
    end

    def initialize(env = {})
      super(Rack::MockRequest.env_for('/').merge(env))

      self.host        = 'test.host'
      self.remote_addr = '0.0.0.0'
      self.user_agent  = 'Rails Testing'
    end

    def request_method=(method)
      @env['REQUEST_METHOD'] = method.to_s.upcase
    end

    def host=(host)
      @env['HTTP_HOST'] = host
    end

    def port=(number)
      @env['SERVER_PORT'] = number.to_i
    end

    def request_uri=(uri)
      @env['REQUEST_URI'] = uri
    end

    def path=(path)
      @env['PATH_INFO'] = path
    end

    def if_modified_since=(last_modified)
      @env['HTTP_IF_MODIFIED_SINCE'] = last_modified
    end

    def if_none_match=(etag)
      @env['HTTP_IF_NONE_MATCH'] = etag
    end

    def remote_addr=(addr)
      @env['REMOTE_ADDR'] = addr
    end

    def user_agent=(user_agent)
      @env['HTTP_USER_AGENT'] = user_agent
    end

    def accept=(mime_types)
      @env.delete("action_dispatch.request.accepts")
      @env["HTTP_ACCEPT"] = Array(mime_types).collect { |mime_types| mime_types.to_s }.join(",")
    end
  end
end
