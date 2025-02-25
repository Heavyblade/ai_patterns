require_relative '../ai_patterns'

# Prompt Object
#
# Encapsulating prompts as objects with associated attributes,
# metadata, and behaviors.
# One of the most important advantages of Prompt Object, given
# the importance of constant iteration and testing of prompts,
# is the ability to implement versioning schemes

my_prompt = Prompt.new('hobby', 'what new hobby should I try today?, response in just one line.')
my_prompt.parameters = { role: 'user' }
my_prompt.save

my_prompt = Prompt.load('hobby')
puts my_prompt.content
