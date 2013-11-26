class PluCode < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  after_create :queue_processing
  
  def process(text)    
    self.number = text.scan(/[0-9]+/).first
    self.description = text.gsub(/#{self.number}/, '')
    puts text
    self.save
  end 

  def queue_processing
    Resque.enqueue Processor, id
  end

end
