module PluCodesHelper

  def results(codes)
    results = ''
    codes.each do |c|
      results << image_tag(c.image)
    end
    results.html_safe
  end

end
