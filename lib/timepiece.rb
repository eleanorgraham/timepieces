class Timepiece
  attr_accessor :name, :price
  @@all = []

  def initialize(product_hash)
    product_hash.each {|key, value| self.send("#{key}=", "#{value}")}
    Timepiece.all << self
  end

  def self.create_from_collection(product_array)
    product_array.each do |product|
      if Timepiece.all.include?(product) == false
        Timepiece.new(product)
      end
    end
  end

  def self.all
    @@all
  end
end
