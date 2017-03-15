class BidSummaryController < ApplicationController

  def index
    products = Product.last
    bidders = Bidder.last
    bids = ["1", "2", "6"]
    @bid_summary = BidSummary::IndexView.new(products, bidders, bids)
#    binding.pry
  end
end
