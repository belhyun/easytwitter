class Belhyun 
  class << self
    def belhyun2
      p 'belhyun2'
    end
  end

  def initialize
    p 'construction'
  end 

  def test!
    true
  end

  def test2?
    true
  end

  def test3
  end
end

Belhyun.belhyun2
belhyun = Belhyun.new
p belhyun.test!
p belhyun.test2?
p belhyun.test3
