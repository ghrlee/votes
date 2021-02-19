class Flag
  FRAME_OFFSET = 5
  FULL_HEIGHT = 150
  FULL_WIDTH = 200
  BASE_COLOR = '#A463F2'

  def create_flag
    frame = create_frame

    image = create_flag_image

    # Combine objects into a single image
    svg = Victor::SVG.new viewBox: '0 0 200 150'
    svg << frame
    svg << image

    # ... and save it
    svg.render
  end

  def create_frame
    frame = Victor::SVG.new
    frame.rect x: 0, y: 0, width: 300, height: 200, fill: BASE_COLOR
    frame.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: 200 - (FRAME_OFFSET*2), height: 150 - (FRAME_OFFSET*2), fill: 'white'
    return frame
  end

  def create_flag_image
    flag_type = ['horizontal', 'vertical', 'banner', 'horizontal_bars'].sample
    # flag_type = ['horizontal_bars'].sample
    image = send "#{flag_type}_flag"
    image.render
    return image
  end

  def banner_flag
    banner_flag_image = Victor::SVG.new
    banner_flag_image.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: offset_width, height: offset_height, fill: Faker::Color.color_name
    banner_flag_image << add_shape_from_file

    return banner_flag_image
  end

  def horizontal_flag
    horizontal_flag_image = Victor::SVG.new
    horizontal_flag_image.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: (180.0 * 0.33), height: offset_height, fill: Faker::Color.hex_color
    horizontal_flag_image.rect x: (FULL_WIDTH - (offset_width / 3)), y: FRAME_OFFSET, width: (180.0 * 0.33), height: offset_height, fill: Faker::Color.hex_color

    shape = case rand(100) + 1
      when 50..100 then horizontal_flag_image << add_shape_from_file
    end

    return horizontal_flag_image
  end

  def horizontal_bars_flag
    vertical_flag_image = Victor::SVG.new
    current_height = FRAME_OFFSET
    num_bars = [3,4,5].sample

    num_bars.times do 
      vertical_flag_image.rect x: FRAME_OFFSET, y: current_height, width: offset_width, height: (FRAME_OFFSET/num_bars) + (offset_height / num_bars), fill: Faker::Color.hex_color
      current_height += (offset_height / num_bars)
    end
    
    return vertical_flag_image
  end

  def vertical_flag
    vertical_flag_image = Victor::SVG.new
    vertical_flag_image.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: offset_width, height: offset_height * 0.33, fill: Faker::Color.hex_color
    vertical_flag_image.rect x: FRAME_OFFSET, y: (FULL_HEIGHT - FRAME_OFFSET) - (offset_height/3), width: offset_width, height: offset_height * 0.33, fill: Faker::Color.hex_color
    return vertical_flag_image
  end

  def offset_width
    FULL_WIDTH - (FRAME_OFFSET * 2)
  end

  def offset_height
    FULL_HEIGHT - (FRAME_OFFSET * 2)
  end

  def add_shape
    shape = Victor::SVG.new
    shape.circle cx: (offset_width / 2) + 10, cy: (offset_height / 2) + 10, r: 25, fill: Faker::Color.hex_color
    shape.polygon points: %w[100,50 80,93 125,65 75,65 120,93], fill: Faker::Color.hex_color

    return shape
  end

  def add_shape_from_file
    files = Dir.entries('app/assets/shapes/').select { |f| f.include?('svg') }

    shape = File.read "app/assets/shapes/#{files.sample}"
    # find "fill" in string and replace with "fill=#{Faker::Color.hex_color}"
    flag_image = Victor::SVG.new
    flag_image << shape
    return flag_image
  end
end

# idea for future: build a color pallette from a random seed by calling https://www.thecolorapi.com/id?hex=24B1E0
# https://www.thecolorapi.com/docs

# https://icons8.com/icons/dotty 
# https://icons8.com/icon/pack/cultures/dotty
# can also use pallete to change path/fill of svg images


# def processLogs(logs, maxSpan)
#   # Write your code here
#   # return an array of strings that are user Ids (first) who signed out in less than or equal max span (second)
#   logs = ["30 99 sign-in", "30 105 sign-out"]
#   response_array = []
#   sign_in_array = []
#   sign_out_array = []
#   logs.each do |log|
#     action = log.split(" ")
#     sign_in_array << log if action[2] == "sign-in"
#     sign_out_array << log if action[2] == "sign-out"
#   end

#   sign_in_array.each_with_index do |log, index|
#     current_id_value = log.split(" ")[0]
#     current_in_value = log.split(" ")[1]
#     current_out_value = sign_out_array[index].split(" ")[1]
#     response_array << current_id_value if (current_out_value.to_i - current_in_value.to_i) <= maxSpan
#   end
# end