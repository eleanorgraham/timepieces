class Controller

  def self.run
    timepieces = Importer.get_timepieces
    Timepiece.create_from_collection(timepieces)
    total = 0
    prices = []
    Timepiece.all.each do |timepiece|
      puts "#{timepiece.name}: $#{timepiece.price}"
      prices << timepiece.price.to_f
      total += timepiece.price.to_f
    end
    puts "Total: $#{'%.2f' % total}"
  end

end
