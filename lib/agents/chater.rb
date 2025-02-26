module Agents
  class Chater
    include Abilities::Chat

    attr_reader :tag

    def initialize(tag)
      @tag = tag
    end
  end
end
