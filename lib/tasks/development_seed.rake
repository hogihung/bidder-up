unless Rails.env.production?
  require 'csv'
  products_file = "data/ComicBooks-and-Prices-Supply.csv"

  namespace :dev do
    desc "Seed development database, maintain consistency"
    task prime: "db:setup" do
      # Create Bidders
      puts "Creating some bidders.....\n"
      BIDDERS = [{first_name: "John", last_name: "Hogarty", limit: 100_000, active: true},
                 {first_name: "Sally", last_name: "Struthers", limit: 140_000, active: true},
                 {first_name: "Dave", last_name: "Minion", limit: 1_000_000, active: true},
      ]

      BIDDERS.each do |bidder|
        Bidder.create(first_name: bidder[:first_name], last_name: bidder[:last_name], 
                      limit: bidder[:limit], active: bidder[:active])
      end
       
      # Create Products (suck in CSV File)
      puts "Parsing CSV File to import the auction products.....\n"
      CSV.foreach(products_file, headers: true) do |row|
        p row
        Product.create!(publisher: row[1], title: row[2], quantity: row[3], reserve_price: row[4])
      end
    end
  end
end
