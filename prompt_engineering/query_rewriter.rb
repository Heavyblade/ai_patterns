require_relative '../ai_patterns'

# Query Reweriter
#
# The idea is to refine the original query to ensure it’s in a form that the LLM
# finds easier to interpret. This process involves simplifying, rephrasing, or
# augmenting the query based on the analysis performed in the previous step.
# The goal is to bridge the gap between the user’s natural language and the
# LLM’s optimal input format for information retrieval.
#
# Possible goals:
#
# * Simplification.
# * Repharasing for clarity.
# * Keyword Enhancement.

# original_query = 'Do you have the red sneakers in size 10?'
original_query = "I'm looking for a pair of jordans and I was wondering if you have it in size 10, perhaps in red"

possible_intents = [
  'asking for product price',
  'asking for product availability',
  'asking for product reference',
  'asking for product recommendation',
  'asking for product specifications',
  'asking for product features',
  'asking for product warranty',
  'asking for product return policy',
  'asking for product shipping policy'
]

prompt = <<~PROMPT
  Given the original query: "#{original_query}"

  first identify the intent of the user query. The possible intents are:

  #{possible_intents.map { |intent| "* #{intent}" }.join("\n")}

  output the selected intent like:

  <intent>selected intent inside</intent>

  Then, extract the main entities from the query, and output them like:

  <entities>
    <entity type="entity_type">entity type</entity>
    <entity type="shoe_brand">Nike</entity>
  </entities>

  Finally, rewrite the query to make it more suitable for the LLM, output
  taking into account the selected intent and the extracted entities:

  <rewritten_query>Do you have the red Nike sneakers in size 10?</rewritten_query>
PROMPT

messages = [
  { role: 'user', content: prompt }
]

puts Agents::Chater.new(:rewriter).chat(messages: messages)
