class BidSummaryController < ApplicationController
require 'ruby-prof'

  def index
    RubyProf.start                                           # starts the profiling process

    products = Product.all
    bidders = Bidder.all
    bids = Bid.all

    @bid_summary = BidSummary::IndexView.new(products, bidders, bids)

    render 'index'
    profile_result = RubyProf.stop                           # stops profiling, storing in variable
    RubyProf::FlatPrinter.new(profile_result).print(STDOUT)  # prints out to your server console

    # Create a .cg file of the gathered data so we can view with qcachegrind
    stampit = DateTime.now.strftime("%H_%M_%S")              # create a time stamp
    RubyProf::CallTreePrinter.new(profile_result).print(profile: "data/perf_profile/BEFORE/bid_summary-#{stampit}")
  end
end
