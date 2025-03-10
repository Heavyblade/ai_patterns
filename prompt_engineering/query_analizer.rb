require_relative '../ai_patterns'

# Query Analyzer
#
# This pattern is a step before 'prompt_rewriter' and is used to
# extract the prompt structure, making it more efficient and accurate
# to improve the query or to restructure it so it is better aligned
# with the retrieval services.
#
# what is extracted?
#
# - Intent
# - Context
# - Needed information
#
# Note: Analyzers can alsoe be implemented using other AI-NPL techniques
#
# Implementation:
#
# To implement this analysis POS tagging, NER, and other NLP techniques
# used.
#
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# Intent Clasification
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

prompt = <<~PROMPT
  Classify the following query into one of the predefined intents based on
  the examples provided.

  Predefined Intents:
  1. Informational: Queries seeking information or answers to questions.
  Examples:
  - What is the capital of France?
  - How to bake a chocolate cake?
  - Who won the World Cup in 2018?

  2. Navigational: Queries seeking a specific website or web page.
  Examples:
  - Facebook login
  - YouTube
  - Amazon Prime Video

  3. Transactional: Queries expressing an intent to perform an action or transaction.
  Examples:
  - Buy iPhone 12
  - Download Microsoft Office
  - Book a flight to New York

  Query: "Where is my order #172838. It was supposed to arrive a week ago!"

  Example Output: <intent>Informational</intent>
PROMPT

messages = [
  { role: 'system', content: 'You are an expert in prompt engineering' },
  { role: 'user', content: prompt }
]

puts Agents::Chater.new(:prompt_analyzer).chat(messages: messages)

# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# Extracting key words for RAG
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

template_string = <<~PROMPT
  Extract the most important keywords or phrases from the following query
  that represent the core information need. Limit the extraction to a maximum
  of 5 keywords and prioritize specific locations, activities, or attributes
  mentioned in the query.

  Query: <%= query %>

  Keywords: (one per line)
PROMPT

query = 'What are the best hiking trails near Denver for beginners?'
prompt = PromptTemplate.new('greeter', template_string).evaluate(query: query)

messages = [
  { role: 'system', content: 'You are an expert in prompt engineering' },
  { role: 'user', content: prompt }
]

puts Agents::Chater.new(:prompt_analyzer).chat(messages: messages)
