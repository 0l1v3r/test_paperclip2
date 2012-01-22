class Asset < ActiveRecord::Base
	
	belongs_to :post	
	has_attached_file 	:asset, 
						:path => ":rails_root/public/system/:attachment/:id/:style/:normalized_video_file_name",
    					:url => "/system/:attachment/:id/:style/:normalized_video_file_name",	
						:styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100>" }	
	

  	Paperclip.interpolates :normalized_video_file_name do |attachment, style|
    	attachment.instance.normalized_video_file_name
  	end

	def normalized_video_file_name
    	"#{self.id}-#{self.asset_file_name.gsub( /[^a-zA-Z0-9_\.]/, '_')}" 
  	end	  	
end
