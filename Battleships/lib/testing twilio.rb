require './lib/text_sender'
require 'twilio_ruby'

describe TextSender do

let (:client) do
	Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
end

let (:ptolemy) {double :person,     number '441708394030'}
let (:dan)     {double :person,     number '447570358355', name: "Alex"}

it 'sends a message' do
  TextSender.call(message: "Hello", from: ptolemy, to: dan, via: client) 
end

