module MyEnumerable
  def select
    unless block_given?
      return self
    newarray = []
    self.each { |x| newarray << x if yield(x)}
  end

  def map
    unless block_given?
      return self
    newarray = []
    self.each { |x| newarray << yield(x)}
    return newarray
  end
  alias_method :collect, :map

  def first(n=0)
    if n=0
      return self[0]
    newarray = []
    until i>n do
      newarray << self[i]
      i+=1
    end
    return newarray
  end

  def count(item=undefined)
    res = 0
    if block_given? do
      self.each { |x| res+=1 if yield(x) }
      return res
    end
    if undefined.equal?(item) do 
      self.each { res+=1 }
    else
      self.each { |x| res+=1 if x==item }
    end
    return res
  end

  def all?
    if block_given?
      self.each { |x| return false unless yield(x) }
    else
      self.each { |x| return false unless x }
    end
    return true
  end

  def any?
    if block_given?
      self.each { |x| return true if yield(x) }
    else
      self.each { |x| return true if x }
    end
    return false
  end
end