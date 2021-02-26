class State < ActiveRecord::Base
  attr_accessor :flag

  def get_flag
    if self.national_flag.empty?
      flag = Flag.new
      self.national_flag = flag.create_flag
      self.save
    end
    return self.national_flag
  end

  def get_leader
    # if self.national_flag.empty?
    #   flag = Flag.new
    #   self.national_flag = flag.create_flag
    #   self.save
    # end
    # return self.national_flag
    Leader.new.get_profile_image
  end

  def have_election
    # gets called by the cron job
    # finds the event list
    # adds an election event to the event list
    puts "Let's have an election"
  end

# votes like make national beverage coffee or tea
  
end