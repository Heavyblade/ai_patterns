require_relative '../ai_patterns'

# Prompt Template
#
# Allows you to use static and dynamic templates to generate prompts.
# We can use ERB, Haml, Mustache, or any other template engine
# to generate dynamic prompts.

template = PromptTemplate.new('greeter', 'Hello, <%= name %>')
template.save

Customer = Struct.new(:name) do
  def get_binding
    binding
  end
end

prompt = PromptTemplate.load('greeter').evaluate(Customer.new('John'))

# Use an evaluated prompt template to create a new prompt.
Prompt.new('hobby', prompt)

