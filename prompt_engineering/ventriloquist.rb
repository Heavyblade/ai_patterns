require_relative '../ai_patterns'

# Ventriloquist
#
# This pattern starts with a prompt that already has some interactions,
# mimicking a conversation. The idea is to continue the conversation with
# the LLM.
#
# It is like an advanced few-shot example where you show the AI the tone
# and direction of the conversation.
#
# it "putting words on AI mouth"
#
# |> The AI, being a language model trained to maintain coherence and consistency,
# |> will naturally follow the established context and generate responses that
# |> continue along the same path.

# Getting alternative keyworks

query = 'find tools to play football'
promtp = <<~PROMPT
  Matching the original language of the question generate 3 alternate
  keywords that might produce better results. Reply with just the list,
  one per line.
PROMPT

messages = [
  { role: 'system', content: 'You are a powerful search engine' },
  { role: 'user', content: query },
  { role: 'assistant', content: 'Searching... no results found.' },
  { role: 'user', content: promtp }
]

puts Agents::Chater.new(:role_player).chat(messages: messages)
