module Agents
  class Chat
    attr_reader :tag

    Langchain.logger.level = Logger::WARN

    def initialize(tag)
      @tag = tag
      @llm = Langchain::LLM::OpenAI.new(
        api_key: ENV['OPENAI_API_KEY'],
        default_options: { temperature: 0.7, chat_model: 'gpt-4o' }
      )
      set_adapter!('gpt-4o')
    end

    def chat(messages:)
      @llm.chat(messages: messages).chat_completion
    end

    private

    def set_adapter!(model)
      @llm = Langchain::LLM::OpenAI.new(
        api_key: ENV['OPENAI_API_KEY'],
        default_options: { temperature: 0.7, chat_model: model }
      )
    end
  end
end
