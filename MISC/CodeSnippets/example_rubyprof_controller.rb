class NurnyController < ActionController
# Add this require at the top of your controller file:
require 'ruby-prof'

  # Let's say you want to check the performance of your index action:
  def index
      RubyProf.start                                           # starts the profiling process
      @nurny = NurnyBot::IndexView.new(user, status, @bobots)

      render 'index'

      profile_result = RubyProf.stop                           # stops profiling, storing in variable
      RubyProf::FlatPrinter.new(profile_result).print(STDOUT)  # prints out to your server console
      stampit = DateTime.now.strftime("%H_%M_%S")              # create a time stamp

      # Create a .cg file of the gathered data so we can view with qcachegrind
      open("data/perf_profile/BEFORE/nurny_test_#{stampit}.cg", "w") do |f|
        RubyProf::CallTreePrinter.new(profile_result).print(f)
      end
  end

end
