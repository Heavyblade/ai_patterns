require_relative '../ai_patterns'

# Prompt Rewriter
#
# Is a pattern where you use the AI to improve the actual prompt, here what
# matters are the instructions about what constitutes a good prompt, and the
# AI will rewrite the prompt to make it better.

prompt = <<~PROMPT
  Given the following prompt, analyze and rewrite it add clarity and precision,
  using prompt engineering best practices:

  <prompt>
   Summarize the next news article:
  <prompt>
PROMPT

messages = [
  { role: 'system', content: 'You are an expert in prompt engineering' },
  { role: 'user', content: prompt }
]

puts Agents::Chater.new(:prompt_rewriter).chat(messages: messages)
