require_relative '../ai_patterns'

# Structured I/O
#
# Structured I/O involves applying a structure in XML, JSON, or YAML to the input/output
# to be more specific about the data being passed around.
#
# From the input point of view, it improves accuracy.
# From the output point of view, it makes the output easier to parse.
#
# Notes:
# * It could be more expensive.
# * It could reduce the LLM's flexibility/creativity.
# * Compatibility could be an issue, as not all LLMs support structured I/O.

prompt = <<~PROMPT
  <description>
    The SmartHome Mini is a compact smart home assistant available in black or
    white for only $49.99. At just 5 inches wide, it lets you control lights,
    thermostats, and other connected devices via voice or app—no matter where you
    place it in your home. This affordable little hub brings convenient
    hands-free control to your smart devices.
  </description>

  Extract:

   <product>
     <name></name>
     <size></size>
     <price></price>
     <color></color>
   </product>

  from this product <description>.
PROMPT

messages = [
  { role: 'system', content: 'you are an intelligent product description parse' },
  { role: 'user', content: prompt }
]

agent = Agents::Chater.new(:role_player)
puts agent.chat(messages: messages)
