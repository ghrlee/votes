class State < ActiveRecord::Base
  attr_accessor :flag

  def get_flag
    if self.national_flag.empty?
      self.national_flag = create_flag
      self.save
    end
    return self.national_flag
  end

  # def create_flag
  #   svg = Victor::SVG.new width: 140, height: 100, style: { background: "#{Faker::Color.hex_color}" }
  #   rand(1..4).times do
  #     element = SVG.new.polygon points: get_polygon_points, fill: Faker::Color.hex_color.to_s
  #     svg << element
  #   end
  #   svg.render
  # end

  # def get_polygon_points
  #   points_array = []
  #   rand(3...6).times do
  #     points_array << "#{rand(0...100)},#{rand(0...140)}"
  #   end
  # end

  def create_flag
    # Create a reusable SVG object
    frame = Victor::SVG.new
    frame.rect x: 0, y: 0, width: 100, height: 100, fill: '#336'
    frame.rect x: 5, y: 5, width: 90, height: 90, fill: Faker::Color.hex_color

    # ... and another
    troll = Victor::SVG.new
    troll.circle cx: 50, cy: 60, r: 24, fill: Faker::Color.hex_color
    troll.polygon points: get_poly_points, fill: Faker::Color.hex_color

    # Combine objects into a single image
    svg = Victor::SVG.new viewBox: '0 0 100 100'
    svg << frame
    svg << troll

    # ... and save it
    svg.save 'framed-troll'
    svg.render
  end

  def get_poly_points
    points_array = []
    rand(3...6).times do
      points_array << "#{rand(5...75)},#{rand(5...75)} "
    end
    points_array
  end

  # function for calculating a start
  # getStarPoints: function (){
  #    let centerX = 0;
  #    let centerY = 0;

  #    let innerCirclePoints = 5; // a 5 point star
    
  #    // this.style.starWidth --> this is the beam length of each
  #    // side of the SVG square that holds the star
  #    let innerRadius = this.style.starWidth / innerCirclePoints;
  #    let innerOuterRadiusRatio = 2; // outter circle is x2 the inner
  # let outerRadius = innerRadius * innerOuterRadiusRatio;

  #    return this.calcStarPoints(centerX, centerY, innerCirclePoints, innerRadius, outerRadius);
  # },
  
end