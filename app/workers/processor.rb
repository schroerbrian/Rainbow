# j = a.process_image i, "exportFormat" => "txt", "profile" => "textExtraction", "imageSource" => "photo"

class Processor
  @queue = :scanner

  def self.perform(object_id)
    product = PluCode.find object_id
    client = Abbyy::Client.new
    client.process_image product.image.path, :exportFormat => 'txt', :imageSource => 'photo', :profile => "textExtraction"
    while %w(Queued InProgress).include?(client.task[:status])
      sleep(client.task[:estimatedProcessingTime].to_i)
      client.get_task_status
    end
    if client.task[:status] == 'Completed'      
      product.process!(client.get)
    else
      Rails.logger.info "Task did not complete successfully. Why?"
    end
  end
end