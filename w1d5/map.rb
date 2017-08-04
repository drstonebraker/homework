class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    remove(key)
    @map << [key, val]
    key
  end

  def lookup(key)
    @map.assoc(key).to_a.last
  end

  def remove(key)
    @map.reject! {|pair| pair.first == key}
    nil
  end

  def show
    @map.dup.map(&:dup)
  end
end
