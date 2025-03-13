require_relative '../ai_patterns'

# Predicated
#
# A predicated is pattern that is used when you wnat the LLM to make a decision
# specifically a yes or no decision.
#
# Examples:
#
# * Deciding if should proceede with a task.
# * Checking if user imput is complete, see prompt_chaining.rb
#
# Considerations:
# Here the temperature value is important, so the desicion is more deterministic.

system_query = <<~PROMPT
  does the user provide enough information that allows you to provide
  an accourate movie recommendationl.

  I need you to provide "Yes" or "No" as an answer.
PROMPT

user_context = <<~PROMPT
  I enjoy watching a variety of movies, but my favorites are those with
  complex characters and intricate plots. I particularly love psychological
  thrillers and dramas that keep me on the edge of my seat. Additionally, I have
  a soft spot for classic films and enjoy the occasional light-hearted comedy.

  #{system_query}
PROMPT

messages = [
  { role: 'system', content: 'You are a powerful search engine' },
  { role: 'user', content: user_context }
]

puts Agents::Chater.new(:role_player).chat(messages: messages, temperature: 0.0)
