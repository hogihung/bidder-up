unless Rails.env.production?
  require 'csv'
  products_file = "data/ComicBooks-and-Prices-Supply.csv"

  namespace :dev do
    desc "Seed development database, maintain consistency"
    task prime: "db:setup" do
      # Create Bidders
      puts "Creating some bidders.....\n"
      BIDDERS = [{buid: "jf521", first_name: "John", last_name: "Fogarty", limit: 100_000, active: true},
                 {buid: "ss029", first_name: "Sally", last_name: "Struthers", limit: 140_000, active: true},
                 {buid: "dm225", first_name: "Dave", last_name: "Minion", limit: 1_000_000, active: true},
      ]

      BIDDERS.each do |bidder|
        Bidder.create(buid: bidder[:buid], first_name: bidder[:first_name],
                      last_name: bidder[:last_name], limit: bidder[:limit], 
                      active: bidder[:active])
      end
       
      # Create Products (suck in CSV File)
      puts "Parsing CSV File to import the auction products.....\n"
      CSV.foreach(products_file, headers: true) do |row|
        p row
        Product.create!(aucid: row[1], publisher: row[2], title: row[3], quantity: row[4], reserve_price: row[5])
      end
    end
  end
end
