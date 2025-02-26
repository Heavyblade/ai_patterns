require_relative '../ai_patterns'

# Role Assignment
#
# Nothing new here, is the first thing to learn on Generative AI work,
# basically assign a particular role to the LLM To Narrow the Scope.

librarian = 'you are a dedicated librarian that enjoys history'
narrator = 'you are an enthusiastic sports narrator'

messages = [
  { role: 'system', content: narrator },
  { role: 'user', content: 'what new hobby should I try today?, response in just one line.' }
]

agent = Agents::Chater.new(:role_player)

puts "Narrator: #{agent.chat(messages: messages)}"
messages[0][:content] = librarian

puts "Librarian: #{agent.chat(messages: messages)}"
