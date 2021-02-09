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

  def have_election
    # gets called by the cron job
    # finds the event list
    # adds an election event to the event list
    puts "Let's have an election"
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

#   calcStarPoints(centerX, centerY, innerCirclePoints, innerRadius, outerRadius) {
#    const angle = (Math.PI / innerCirclePoints);
#    const angleOffsetToCenterStar = 0;

#    const totalPoints = innerCirclePoints * 2; // 10 in a 5-points star 
#    let points = '';
#    for (let i = 0; i < totalPoints; i++) {
#       let isEvenIndex = i % 2 == 0;
#       let r = isEvenIndex ? outerRadius : innerRadius;
#       let currX = centerX + Math.cos(i * angle + angleOffsetToCenterStar ) * r;
#       let currY = centerY + Math.sin(i * angle + angleOffsetToCenterStar) * r;
#       points += currX + ',' + currY + ' ';
#    }
#    return points;
# },
# votes like make national beverage coffee or tea
  
end