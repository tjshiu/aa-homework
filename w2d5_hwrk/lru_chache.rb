class LRUCache

  def initialize(size = 4)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el) #this is O(n) where n is the size of the cache
    if @cache.count(el) == 1
      @cache.delete(el)
    elsif count == @size
      @cache.shift
    end
    @cache << el
  end

  def show
    print @cache
    nil
  end
end
