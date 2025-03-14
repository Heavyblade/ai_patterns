require_relative '../ai_patterns'

# API Facade
#
# Basically follows the same logic the Facade pattern of the GoF, but in this case
# is applied to simplify the intereaction with the LLM, mostly when dealing with
# tool use cases, you don't want to over complicate what the LLM needs to do, so
# this pattern offers a simplified interface to the LLM.

class PaymentTool
  extend Langchain::ToolDefinition

  define_function :make_payment, description: 'Perform the payment action' do
    property :value, type: 'integer', description: 'The amount of money you want to pay'
  end

  def make_payment(value:)
    gateway = value.to_i > 100 ? :braintree : :stripe
    Payment.new.pay(value.to_i, '1234 5678 9012 3456', type: gateway)

    tool_response(content: "Payment of $#{value} was successful.")
  end
end

date = Date.new(2025, 3, 15)
subscription = <<~SUBSCRIPTION_PROMPT
   I have the following suscription plans:

  <plans>
  <plan>
    <name>Netflix</name>
    <price>10</price>
    <pay_day>2</pay_day>
  </plan>
  <plan>
    <name>HBO Max</name>
    <price>10</price>
    <pay_day>15</pay_day>
  </plan>
  </plans>

  Today is #{date}, If one of my suscriptions should be pay, use the make_payment tool to pay it.
SUBSCRIPTION_PROMPT

llm = Langchain::LLM::OpenAI.new(api_key: ENV['OPENAI_API_KEY'])
assistant = Langchain::Assistant.new(
  llm: llm,
  instructions: "You're a helpful payment assistant AI assistant in recurring payments.",
  tools: [PaymentTool.new]
)

assistant.add_message(content: subscription, role: 'user')
assistant.run!

assistant.messages.each { |message| puts "#{message.content}\r#{'x' * 100}" }
