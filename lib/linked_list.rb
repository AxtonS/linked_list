# frozen_string_literal: true

require 'pry-byebug'

# Holds methods and creates new linked lists
class LinkedList
  attr_accessor :head

  def initialize(value = nil)
    @head = Node.new(value)
  end

  def append(value)
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.nil?

    pointer.next_node = Node.new(value)
  end

  def prepend(value)
    pointer = @head
    @head = Node.new(value, next_node = pointer)
  end
end

# Creates elements to be used in linked lists
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
