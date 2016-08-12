# Ruby Tricks

### Class Level Instance Variable
ruby```class Parent
  @things = []

  class << self
    attr_accessor :things
  end
end```

### Both Class Level AND Instance Level Instance Variable
ruby```class Parent
  attr_accessor :things
  @things = []
  
  class << self
    attr_accessor :things
  end
  
  def initialize
    @things = self.class.things
  end
  
end```


