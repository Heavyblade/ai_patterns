require 'erb'

class PromptTemplate
  attr_accessor :name, :content

  def initialize(name, content)
    @name = name
    @content = content
  end

  def save
    File.write(path, content)
  end

  def evaluate(context)
    ERB.new(content).result_with_hash(context)
  end

  def self.load(name)
    path = File.join('lib', 'templates', "#{name}.erb")
    raise "Template #{name} not found" unless File.exist?(path)

    new(name, File.read(path))
  end

  private

  def path
    File.join('lib', 'templates', "#{name}.erb")
  end
end
