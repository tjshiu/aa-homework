class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup #why is there a .dup?
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    el
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value = nil)
    if lookup(key)
      @map.each_with_index do |kv, i|
        @map[i] = [key, value] if kv[0] == key
      end
    else
      @map.push([key, value])
    end
    [key, value] #? not sure about this return either
  end

  def lookup(key)
    @map.each {|arr| return arr[1] if arr[0] == key}
    nil
  end

  def remove(key)
    @map.delete([key, lookup(key)]) if lookup(key)
    nil
  end

  def show
    @map.dup
  end

  private
  def deep_dup(arr)
    arr.map {|el| el.is_a? Array ? deep_dup(el) : el}
  end
end
