require 'sinatra'
require 'json'
require_relative 'lib/helpers'
require_relative 'lib/equation_solution'

before do
  response['Access-Control-Allow-Origin'] = 'http://localhost:3000'
end

options '/' do
  response['Access-Control-Allow-Headers'] = 'Authorization, Content-Type'
  response['Access-Control-Allow-Methods'] = 'POST'
end

post '/' do
  begin
    payload = JSON.parse(request.body.read)
    authenticate!(payload)
    res = EquationSolution.new(payload).result
    content_type :json
    { x1: res[0].to_s, x2: res[1].to_s }.to_json
  rescue => error
    { error: error }.to_json
  end
end
