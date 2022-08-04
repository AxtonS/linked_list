# frozen_string_literal: true

require 'pry-byebug'

class LinkedList; end

# Creates elements to be used in the list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
