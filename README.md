# votes
I don't know what this is yet

class State < ActiveRecord::Base
  attr_accessor :has_flag?

  def state_flag
    # create flag column default false
    flag = if has_flag?
              # find file in assets
            else
              create_flag
            end
    flag
  end

  def method_name
    svg = Victor::SVG.new width: 140, height: 100, style: { background: "#{Faker::Color.hex_color}" }
    result = svg.render
  end
  
end
