require_relative '../ai_patterns'

# This module changes the approach of directly asking for an answer by setting the problem
# resolution to guide the LLMS through a set of steps with intermediary results.
# Each step should reinforce the current context.
#
# == Types:
#
# - Explicit: The user provides the steps.
# - Implicit: The user asks the LLM to layout the steps.
#
# == Advantages:
#
# - Improved Accuracy
# - Enhanced Problem-Solving
# - Increased Transparency
# - Flexibility
#
# == Considerations:
#
# - Expensive: More tokens needed
# - Longer processing time
# - More complex prompts
#

prompt = <<~PROMPT
  Mary has 12 cookies and eats 4, how many cookies does she has left?

  What is the starting number of cookies Mary has?
  How Many cookies does Mary eat?
  How can we find the remaining cookies?
PROMPT

messages = [
  { role: 'user', content: prompt }
]

puts Agents::Chater.new(:role_player).chat(messages: messages)
