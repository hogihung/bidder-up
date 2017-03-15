class BidSummaryController < ApplicationController

  def index
    products = Product.all
    bidders = Bidder.all
    bids = Bid.all

    @bid_summary = BidSummary::IndexView.new(products, bidders, bids)
  end
end
