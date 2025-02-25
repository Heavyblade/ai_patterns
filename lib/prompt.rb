class Prompt
  attr_accessor :name, :content, :parameters, :metadata

  def initialize(name, content, parameters = {}, metadata = {})
    @name = name
    @content = content
    @parameters = parameters
    @metadata = metadata
  end

  def self.load(name)
    path = File.join('lib', 'prompts', "#{name}.json")
    raise "Prompt #{name} not found" unless File.exist?(path)

    json = JSON.parse(File.read(path))
    new(name, json['content'], json['parameters'], json['metadata'])
  end

  def save
    File.write(path, JSON.pretty_generate({
                                            content: content,
                                            parameters: parameters,
                                            metadata: metadata
                                          }))
  end

  private

  def path
    File.join('lib', 'prompts', "#{name}.json")
  end
end
