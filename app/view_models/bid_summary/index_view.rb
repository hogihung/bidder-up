module BidSummary
  class IndexView
    include ApplicationHelper

    attr_reader :products, :bidders, :bids

    def initialize(products, bidders, bids)
      @products = products
      @bidders  = bidders
      @bids     = bids
    end

    def bid_rows
      demand = product_demand(products, bids)
      create_rows(products, bids, bidders, demand)
    end

    def create_rows(products, bids, bidders, demand)
      rows = []
      bids.each do |bid|
        data = OpenStruct.new
        data.aucid = bid.puid
        data.title = bid.title
        data.quantity = bid.quantity
        data.high_bid = get_high_bid
        data.demand = demand.fetch(bid.puid)
        data.reserve_met = reserve_met?(data.high_bid, bid.bid_amount)
      rows << data
      end

      rows
    end

    def product_demand(products, bids)
      demand = {}
      products.each do |product|
        demand[product.aucid] = 0
      end

      bids.each do |bid|
        next unless demand[bid.puid]
        demand[bid.puid] += 1
      end
      demand
    end

    def reserve_met?(high_bid, bid_amount)
      (high_bid < bid_amount) ? "Y" : "N"
    end

    def get_high_bid
      # Stub this out - for demo purposes
      ["29.99", "5.25", "14.95", "150.00", "3.50", "7.10"].sample.to_f
    end

    def lookup_reserve_price(aucid)
      product = Product.where(aucid: aucid).first
      product.reserve_price.to_f
    end
  end
end
