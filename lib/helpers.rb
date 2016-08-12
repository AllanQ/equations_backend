require 'openssl'
require 'base64'

helpers do
  def authenticate!(payload)
    if env['HTTP_AUTHORIZATION'] &&
      env['HTTP_AUTHORIZATION'].split(':').length == 2
      auth_header = env['HTTP_AUTHORIZATION'].split(':')
    else
      halt 401
    end
    public_key_client = auth_header[0]
    signature         = auth_header[1]
    public_key_server = File.read('config/.keys/key.pub').split(' ')[1]
    halt 403 unless public_key_client == public_key_server
    uri = request.path
    body = payload.to_s
    str = ''
    File.readlines('config/.keys/key').each do |line|
      str << line if line[0] != '-'
    end
    private_key = str.gsub(/\n/, '')
    computed_signature = Base64.encode64(OpenSSL::HMAC
      .digest(OpenSSL::Digest.new('sha512'), uri + body, private_key))
      .strip.gsub(/\n/, '')
    computed_signature = computed_signature.gsub(/\n/, '')
    halt 403 unless computed_signature == signature
  end
end
