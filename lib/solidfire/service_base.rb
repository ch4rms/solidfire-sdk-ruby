require_relative 'errors'

class ServiceBase
  attr_accessor :connection_version
  def initialize(host, port, username, password, connection_version, verify_ssl)
    @user = username
    @pass = password
    @host = host
    @port = port
    self.connection_version = connection_version.to_f
    if verify_ssl
      @verify_mode = OpenSSL::SSL::VERIFY_PEER
    else
      @verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    @post_ws = '/json-rpc/' + connection_version.to_s
    @url = 'https://' + @host + ':' + @port.to_s + '/json-rpc/' + self.connection_version.to_s
  end

  # Posts the request hand handles errors.
  def send_request(payload)
    uri = URI.parse(@url)
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    https.verify_mode = @verify_mode
    req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
    req.body = payload.to_json
    req.basic_auth @user, @pass
    res = https.request(req)
    output = JSON.parse(res.body)
    if output.keys.include? "error"
      raise ApiServiceError.new(payload['method'], output['error'])
    end
    return output["result"]
  end

  def check_connection(version, type)
    if self.connection_version < version
      raise 'The connection version is too low. You need a connection of at least version "+version+" to run this command.'
    end
    if type == 'Cluster' && @port == '442'
      raise 'This command can only be run on a Cluster connection. You tried to run it on a Node connection.'
    end
    if type == 'Node' && @port == '443'
      raise 'This command can only be run on a Node connection. You tried to run it on a Cluster connection.'
    end
  end

  def check_parameter(param, param_name, expected_type)
    raise ParameterError.new(param_name+' should be of type '+expected_type+'.') unless param.class.name == expected_type
  end
end