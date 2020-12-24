class Flag
  FRAME_OFFSET = 10
  FULL_HEIGHT = 150
  FULL_WIDTH = 200

  def create_flag
    frame = create_frame

    image = create_flag_image

    # Combine objects into a single image
    svg = Victor::SVG.new viewBox: '0 0 200 150'
    svg << frame
    svg << image

    # ... and save it
    svg.save 'framed-troll'
    svg.render
  end

  def create_frame
    frame = Victor::SVG.new
    frame.rect x: 0, y: 0, width: 300, height: 200, fill: '#336'
    frame.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: 200 - (FRAME_OFFSET*2), height: 150 - (FRAME_OFFSET*2), fill: 'white'
    return frame
  end

  def create_flag_image
    flag_type = ['horizontal', 'vertical', 'banner'].sample
    image = send "#{flag_type}_flag"

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
    horizontal_flag_image.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: (180.0 * 0.33), height: 130, fill: Faker::Color.hex_color
    horizontal_flag_image.rect x: (190 - (180.0 * 0.33)), y: FRAME_OFFSET, width: (180.0 * 0.33), height: 130, fill: Faker::Color.hex_color

    shape = case rand(100) + 1
      when 50..100 then horizontal_flag_image << add_shape_from_file
    end

    return horizontal_flag_image
  end

  def vertical_flag
    vertical_flag_image = Victor::SVG.new
    vertical_flag_image.rect x: FRAME_OFFSET, y: FRAME_OFFSET, width: offset_width, height: offset_height * 0.33, fill: Faker::Color.hex_color
    vertical_flag_image.rect x: FRAME_OFFSET, y: (FULL_HEIGHT - FRAME_OFFSET) - (130 * 0.33), width: offset_width, height: offset_height * 0.33, fill: Faker::Color.hex_color
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
