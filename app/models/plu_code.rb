class PluCode < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  after_create :process_image
  
  def process_image
    puts Rails.root
    puts self.image.path
    text = TESSERACT.text_for(self.image.path).strip
    self.number = text.scan(/[0-9]+/).first
    self.description = text.gsub(/#{self.number}/, '')
    puts text
    self.save
  end 

end
