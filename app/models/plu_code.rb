class PluCode < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  after_create :process_image
  
  def process_image
    puts Rails.root
    puts self.image.path
    text = ABBYY.run_process_image self.image.path
    self.number = text.scan(/[0-9]+/).first
    self.description = text.gsub(/#{self.number}/, '')
    puts text
    self.save
  end 

end
