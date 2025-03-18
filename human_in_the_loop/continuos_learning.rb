require_relative '../ai_patterns'

# Continuos Learning
#
# Basically uses user feedback to improve the model, this is :ok button that you see
# in some chat applications when they give you a response.
#
# In this patern the feedback is structured and stored for later usage, that could be:
#
# * Improve the model on the training.
# * Improve prompts and adjusting inference parameters.
# * Store in RAG system for future reference.
#
# Where this pattern can be used:
#
# * Recommendation systems.
# * Chatbots and virtual assistants.
# * Predictive maintenance systems.
#
# Note: One posibility is to store the feedback in a RAG system and use it to improve promtps.
