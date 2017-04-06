require 'net/http'
require 'net/https'
require 'uri'

require 'rubygems'
require 'json'
require 'solidfire/element'
require_relative 'lib/solidfire/models'
require_relative 'lib/solidfire/custom_models'

#begin
@user = 'admin'
@pass = 'admin'
@host = '10.117.60.15'
@port = '443'
@connection_version = '9.0'
e = Element.new(@host, @port, @user, @pass, @connection_version, false)
$vols = e.list_volumes()
puts $vols.volumes[0].access

r = GetAccountByIDRequest.new()
r.account_id = 13
puts e.get_account_by_id_with_object(r)

#acct = e.modify_account(13, nil, nil, CHAPSecret.auto_generate())
#puts e.get_account_by_id(13).to_json()
#end

=begin
@user = 'admin'
@pass = 'admin'
@host = '10.117.60.15'
@port = '443'

@post_ws = "/json-rpc/9.0"

@payload ={
    "method" => "ListDriveStats"
}.to_json

uri = URI.parse("https://10.117.60.15:443/json-rpc/9.0")
uri.query = URI.encode_www_form({method: "GetAccountByID", accountID: 13})
https = Net::HTTP.new(uri.host,uri.port)
https.use_ssl = true

# THIS IS BAD NEWS... We need to figure out how to fix this.
https.verify_mode = OpenSSL::SSL::VERIFY_NONE
req = Net::HTTP::Get.new(uri.request_uri)

#req.body = {
#    "method" => "GetAccountByID",
#    "accountID" => 13
#}.to_json
req.basic_auth @user, @pass
res = https.request(req)
puts "Response #{res.code} #{res.message}: #{res.body}"

$v = JSON.parse(res.body, object_class: OpenStruct)
puts $v.result
=end