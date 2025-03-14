require 'net/http'
require 'uri'
require 'json'
require_relative '../ai_patterns'

# Response Interpreter
#
# This patern enters in the conversation when the LLM or a tool call delivers some
# structured data like JSON, XML, or any other format intender to be used by machines
# but the applicatins needs a weay to put that data into user friendly language.
#
# It's other usage is to get a ton of structured data and try to extract some meaning
# from it, like a summary or a conclusion.

uri = URI.parse('https://core.spreedly.com/v1/gateways_options.json')
response = Net::HTTP.get_response(uri)
data = JSON.parse(response.body)
data = data['gateways'].map { |gat| gat.slice('name', 'regions') }

criteria = [
  'works on europe',
  'has a cool name'
]

prompt = <<~PROMPT
  You are a profesional in the payments industry, our client is a merchant
  that has some criteria to select a payment gateway, we have the following:

  #{criteria.map { |criterion| "* #{criterion}" }.join("\n")}

  Please select the top 3 of the following gateways and return their names ordered by coolness of the name and a
  brief description of why the name is cool.
PROMPT

messages = [
  { role: 'system', content: 'you are an intelligent product description parse' },
  { role: 'system', content: prompt },
  { role: 'user', content: "Gateways json data: #{data.to_json}" }
]

puts Agents::Chater.new(:role_player).chat(messages: messages)
