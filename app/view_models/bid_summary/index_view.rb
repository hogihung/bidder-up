module BidSummary
  class IndexView
    include ApplicationHelper

    attr_reader :products, :bidders, :bids

    def initialize(products, bidders, bids)
      @products = products
      @bidders  = bidders
      @bids     = bids
    end
  end
end
