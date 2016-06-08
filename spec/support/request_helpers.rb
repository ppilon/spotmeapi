module Requests  
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
    def api_authorization_header(token)
      request.headers['Authorization'] =  token
    end
  end
end  