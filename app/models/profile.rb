class Profile
  def get_profile_image
    svg = Victor::SVG.new viewBox: '0 0 75 104'
    # binding.pry
    troll = Victor::SVG.new
    troll.circle cx: 50, cy: 60, r: 24, fill: Faker::Color.hex_color
    bg = File.read 'app/assets/profile/profile 1.svg'
    face = File.read 'app/assets/face/face1.svg'
    hair = File.read 'app/assets/hair/hair2.svg'
    # binding.pry
    # /Users/georgelee/practice/Votes/app/assets/profile/profile 1.svg
    svg << bg
    svg << face
    svg << hair
    # svg << troll
    # binding.pry
    # svg.element fill: 'green', stroke: 'red'
    svg.build do 
      css['.main'] = {
        stroke: "green", 
        stroke_width: 2,
        fill: "yellow"
      }
    end
    svg.render

    # find and replace stroke=\"#030000\"
    # find and replace  fill=\"none\"
  end
end