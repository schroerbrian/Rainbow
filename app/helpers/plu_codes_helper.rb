module PluCodesHelper

  def results(codes)
    results = ''
    codes.each do |c|
      results << "#{c.number.to_s}: #{c.description}" + tag("br")
    end
    results.html_safe
  end

end
