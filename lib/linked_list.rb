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

  def size
    counter = 1
    pointer = @head
    until pointer.next_node.nil?
      pointer = pointer.next_node
      counter += 1
    end
    counter
  end

  def tail
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.nil?

    pointer
  end

  def at(index)
    counter = 0
    pointer = @head
    while counter < index
      return nil if pointer.next_node.nil?

      pointer = pointer.next_node
      counter += 1
    end
    pointer
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

test = LinkedList.new(2)
test.append(3)
test.prepend(1)
p test.head.value
p test.head.next_node.value
p test.head.next_node.next_node.value
p test.size
p test.tail
p test.at(0)
