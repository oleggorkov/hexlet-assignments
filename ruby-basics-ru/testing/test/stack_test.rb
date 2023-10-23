# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test

  def setup
    @stack = Stack.new
  end

  def teardown; end

  def test_push_element do
    @stack.push(1)
    assert_equal @stack.items, [1], "Ошибка: Некорректная работа метода push()"
  end

  def test_pop_element do
    @stack.push(1)
    @stack.push(2)
    assert_equal @stack.pop, 2, "Ошибка: Некорректная работа метода pop()"
    assert_equal @stack.items, [1], "Ошибка: Некорректная работа метода pop()"
  end

  def test_clear do
    @stack.push(1)
    @stack.push(2)
    @stack.clear
    assert_equal @stack.items, [], "Ошибка: Некорректная работа метода clear()"
  end

  def test_is_empty do
    assert @stack.is_empty?, "Ошибка: Некорректная работа метода is_empty?"
    @stack.push(1)
    assert_not @stack.is_empty?, "Ошибка: Некорректная работа метода is_empty?"
    @stack.pop
    assert @stack.is_empty?, "Ошибка: Некорректная работа метода is_empty?"
  end

end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
