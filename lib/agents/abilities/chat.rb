module Agents
  module Abilities
    module Chat
      Langchain.logger.level = Logger::WARN

      def llm
        @llm ||= set_adapter!('gpt-4o')
      end

      def chat(messages:)
        llm.chat(messages: messages).chat_completion
      end

      private

      def set_adapter!(model)
        Langchain::LLM::OpenAI.new(
          api_key: ENV['OPENAI_API_KEY'],
          default_options: { temperature: 0.7, chat_model: model }
        )
      end
    end
  end
end
