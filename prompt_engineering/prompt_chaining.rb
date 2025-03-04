require_relative '../ai_patterns'

# Prompt Chaining
#
# Is prompting version of the Chain of Responsibility pattern,
# where you can chain, and is different from chain of thoughts
# because is more a conversation and multi-step request-response
# with and LLM(s) not the intention fo set the execution steps
# in one main prompt.
#
# Ideal for complex data analysis or chat bot that need to hold
# a conversaton with the user or other agents.

# Example interviewer:

role = <<~ROLE
  Your are an interviewer, and you will proceed to ask some questions,
  using a polite and respectful tone, and you will wait for the response.
ROLE

questions = [
  { tag: 'name', question: 'What is your name?' },
  { tag: 'age', question: 'How old are you?' },
  { tag: 'hobby', question: 'What is your favorite hobby?' },
  { tag: 'color', question: 'What is your favorite color?' }
]

instructions = <<~INSTRUCTIONS
  You will take the following questions and ask them to the user, the question are
  formed in a tag and question format:

  <examples>
  * [tag1] - question1
  * [tag2] - question2
  </examples>

  questions:
  #{questions.map { |question| "* [#{question[:tag]}] - #{question[:question]}\n" }}

  When you get a response from the user, you will move to the next
  question and will call the save_answer function.
INSTRUCTIONS

messages = [
  { role: 'system', content: role },
  { role: 'user', content: instructions }
]

agent = Agents::Chater.new(:interviewer)
user_input = ''

while user_input != 'exit'
  response = agent.chat(messages: messages, tools: [Tools::SaveRecord.function_schemas].flatten)
  puts response
  messages << { role: 'system', content: response }

  user_input = gets.chomp
  messages << { role: 'user', content: user_input }
end
