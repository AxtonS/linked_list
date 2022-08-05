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

  def index(num)
    counter = 0
    pointer = @head
    while counter < num
      return nil if pointer.next_node.nil?

      pointer = pointer.next_node
      counter += 1
    end
    pointer
  end

  def pop
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.next_node.nil?
    pointer.next_node = nil
  end

  def contains?(value)
    pointer = @head
    until pointer.next_node.nil?
      return true if pointer.value == value

      return false if pointer.next_node.nil?

      pointer = pointer.next_node
    end
    if pointer.value == value
      true
    else
      false
    end
  end

  def find(value)
    index = 0
    pointer = @head
    return false if contains?(value) == false

    until pointer.value == value
      pointer = pointer.next_node
      index += 1
    end
    index
  end

  def to_s
    pointer = @head
    string = "(#{pointer.value})"
    until pointer.next_node.nil?
      pointer = pointer.next_node
      string << " -> (#{pointer.value})"
    end
    string << ' -> nil'
    string
  end

  def insert_at(value, num)
    if num > size - 1
      append(value)
      return
    elsif num < 1
      prepend(value)
      return
    else
      index(num - 1).next_node = Node.new(value, index(num))
    end
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
test.append(4)
test.pop
test.insert_at(9, 2)
p test.to_s
