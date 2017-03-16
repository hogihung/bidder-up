require 'csv'
products_file = "data/ComicBooks-and-Prices-Supply.csv"
bidders_file  = "data/bidders.csv"
bids_file     = "data/bids.csv"

namespace :dev do
  desc "Seed development database, maintain consistency"
  task prime: "db:setup" do
    # Create Bidders
    puts "Creating some bidders.....\n"
    CSV.foreach(bidders_file, headers: true) do |row|
      p row
      Bidder.create!(buid: row[0], first_name: row[1], last_name: row[2], limit: row[3], active: row[4])
    end
     
    # Create Products (suck in CSV File)
    puts "Parsing CSV File to import the auction products.....\n"
    CSV.foreach(products_file, headers: true) do |row|
      p row
      Product.create!(aucid: row[1], publisher: row[2], title: row[3], quantity: row[4], reserve_price: row[5])
    end

    # Create Pseudo Bids via CSV File)
    puts "Parsing CSV File to import pseudo bids.....\n"
    CSV.foreach(bids_file, headers: true) do |row|
      p row
      #<Bid:0x007fe161619050 id: nil, quantity: nil, bid_amount: nil, notes: nil, created_at: nil, updated_at: nil, buid: nil>
      Bid.create!(puid: row[0], title: row[1], quantity: row[2], bid_amount: row[3], buid: row[4])
    end
  end
end
