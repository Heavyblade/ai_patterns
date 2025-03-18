require_relative '../ai_patterns'

# Virtual Machine
#
# This pattern allows is to basically create a DLS (Domain Specific Language) or pseudo code that
# the LLM can use to "compute" the result you want for that we need to specify:
#
# * Task description
# * Rules to follow
# * present input for the 'function'
# * parse the output


# Maybe a set of rules for a very simple game can be use here for
# the LLM to follow and make a decision.

# game_prompt = <<~PROMPT
#   Task description: Create a simple game where the user has to guess a number between 1 and 10.
#
#   Rules to follow:
#   - The user has 3 attempts to guess the number.
#   - If the user guesses the number correctly, they win.
#   - If the user does not guess the number correctly after 3 attempts, they lose.
# PROMPT

system = <<~PROMPT
  Task description: Translate the following text from English to Spanish.

  Rules to follow:
  - Maintain the original meaning.
  - Use formal language.
PROMPT

user_prompt = <<~PROMPT
  translate("Hello, how are you? I hope you are doing well.") returns: <transalation>
PROMPT

messages = [
  { role: 'system', content: system },
  { role: 'user', content: user_prompt }
]

puts Agents::Chater.new(:role_player).chat(messages: messages)
