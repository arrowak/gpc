  require 'digest/md5'
module ApplicationHelper
	def link_to_remove_fields(name, f)
	    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
	end
  
  def link_to_add_fields(name, f, association)
    new_object ||= f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      	render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def broadcast(channel, recipient, chat_tokens, &block)
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => Digest::MD5.hexdigest(current_user.email.to_s() + recipient.email.to_s()), :current_user_tokens => chat_tokens}}
    uri = URI.parse("http://localhost:9292/faye")
    Rails.logger.info(message)
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
