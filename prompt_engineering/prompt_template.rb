require_relative '../ai_patterns'

# Prompt Template
#
# Allows you to use static and dynamic templates to generate prompts.
# We can use ERB, Haml, Mustache, or any other template engine
# to generate dynamic prompts.

template = PromptTemplate.new('greeter', 'Hello, <%= name %>')
template.save

prompt = PromptTemplate.load('greeter').evaluate(name: 'John')

# Use an evaluated prompt template to create a new prompt.
prompt = Prompt.new('hobby', prompt)

puts prompt.content

