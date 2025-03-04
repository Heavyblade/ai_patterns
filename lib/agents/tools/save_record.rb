require 'json'
require 'fileutils'

module Tools
  class SaveRecord
    ANSWERS_DIR = 'lib/answers'.freeze

    def self.function_schemas
      [
        {
          type: 'function',
          function: {
            name: 'save_answer',
            description: 'Saves the answer to a file.',
            parameters: {
              type: 'object',
              properties: {
                answer: {
                  type: 'string',
                  description: 'The answer to the question.'
                },
                tag: {
                  type: 'string',
                  description: 'The asociated question tag.'
                }
              },
              required: %w[answer tag]
            }
          }
        }
      ]
    end

    def initialize
      FileUtils.mkdir_p(ANSWERS_DIR)
    end

    def save(tag, answer)
      # Define the file path
      file_path = File.join(ANSWERS_DIR, 'records.json')

      # Load existing records or initialize an empty array
      records = if File.exist?(file_path)
                  JSON.parse(File.read(file_path))
                else
                  []
                end

      # Add the new record
      records << { tag: tag, answer: answer }

      # Write the updated records back to the file
      File.open(file_path, 'w') do |file|
        file.write(JSON.pretty_generate(records))
      end
    end
  end
end
