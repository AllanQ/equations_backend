require 'sinatra'
require 'json'
require_relative 'lib/equation_solution'

before do
  response['Access-Control-Allow-Origin'] = 'http://localhost:3000'
end

options '/' do
  response['Access-Control-Allow-Headers'] = 'Content-Type, Content-Length,
 X-Content-Type-Options, X-Frame-Options, X-XSS-Protection'
  response['Access-Control-Allow-Methods'] = 'POST'
  # response['Access-Control-Max-Age'] = (60*1).to_s
end

post '/' do
  payload = JSON.parse(request.body.read)
  res = EquationSolution.new(payload).result
  content_type :json
  { x1: res[0].to_s, x2: res[1].to_s }.to_json
end
