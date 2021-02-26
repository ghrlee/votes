class Leader

  def get_profile_image
    svg = Victor::SVG.new viewBox: '0 0 300 300'
    file = File.read 'app/assets/face/avataaars (4).svg'

    avatar = get_avatar
    svg << file
    svg << avatar
    svg.render

    # find and replace stroke=\"#030000\"
    # find and replace  fill=\"none\"
  end

  def get_avatar
    avatar_parts = ['bodies', 'hair', 'clothes']
    new_avatar = Victor::SVG.new viewBox: '0 0 300 300'
    avatar_parts.each { |part| new_avatar << get_avatar_parts(part) }

    new_avatar << get_face
    new_avatar
  end

  def get_face
    face_parts = ['eyebrows', 'eyes', 'mouth', 'nose']
    face = Victor::SVG.new
    face_parts.each { |face_part| face << get_face_parts(face_part) }

    face
  end

  def get_face_parts(part)
    files = Dir.entries("app/assets/face/#{part}/").select { |f| f.include?('svg') }
    part = File.read "app/assets/face/#{part}/#{files.sample}"
  end

  def get_avatar_parts(part)
    files = Dir.entries("app/assets/#{part}/").select { |f| f.include?('svg') }
    part = File.read "app/assets/#{part}/#{files.sample}"
  end
end

# next save profile as part of nation
# add more symbols for flags