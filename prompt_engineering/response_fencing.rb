require_relative '../ai_patterns'

# Response Fencing
#
# This pattern useses the AI parameter `stop` or equivalent to instruct
# when the LLM should stop generating text, this could be useful to generate
# structures where you are 100% sure how the end looks like.
#
# Is important to take into consideration that depending on the model and task
# context the model may not respect the stop token, so is important to test
# and add defensive programming to ensure code stability.

messages = [
  { role: 'user', content: 'Once upon a time, in a land far away, there was a' }
]

puts Agents::Chater.new(:prompt_rewriter).chat(messages: messages, stop: '.')
