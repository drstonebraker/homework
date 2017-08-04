class Queue
  def initialize
    @queue = []
  end

  def add(el)
    @queue << el
  end

  def remove
    @queue.shift
  end

  def show
    self.dup
  end
end
