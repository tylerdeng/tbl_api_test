module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end

    def clear_json_response
      @json_response = nil
    end
  end

  module HeadersHelpers
    def api_header(_version = 1)
      request.headers['Accept'] = 'application/vnd.twobrightlights.v#{version}'
    end

    def api_response_format(format = Mime::JSON)
      request.headers['Accept'] = "#{request.headers['Accept']},#{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end

    def api_authorization_header(token)
      request.headers['Authorization'] = token
    end
  end

  module Credential
    def sign_in_user
      user = FactoryGirl.create :user
      credentials = { email: user.email, password: 'changeme' }
      post '/v1/sessions', session: credentials
      auth_token = json_response[:auth_token]
      clear_json_response
      [user, auth_token]
    end
  end
end
