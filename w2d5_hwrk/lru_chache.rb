class LRUCache

  def initialize
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    @cache << el
  end

  def show
    print @cache
  end

  private

end
