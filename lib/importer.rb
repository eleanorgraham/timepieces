class Importer

  def self.get_urls
    page_numbers = (1..6).to_a
    urls = page_numbers.map do |page|
      "http://shopicruit.myshopify.com/products.json?page=#{page}"
    end
  end

  def self.get_timepieces
    timepiece_array = []
    self.get_urls.each do |url|
      page = open(url).read
      page_hash = JSON.parse(page)
      page_hash["products"].each do |product|
        if product["tags"].any? {|tag| ["Watch", "Clock"].include?(tag)}
          product["variants"].each do |variant|
            timepiece_array << {
              :name=> "#{product["title"]} - #{variant["title"]}",
              :price=> "#{variant["price"]}"
            }
          end
        end
      end
    end
    timepiece_array
  end

end
