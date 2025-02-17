class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new # nothing, but new object instantiated
tv.manufacturer # NoMethodError, because no instance method called #manufacturer
tv.model # #model will be invoked

Television.manufacturer # class method invoked
Television.model # NoMethodError