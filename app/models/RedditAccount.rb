class RedditAccount < ActiveRecord::Base
	
	attr_accessible :remote_id,
				  	:name,
				  	:comment_karma,
				  	:link_karma,
				  	:created,
				  	:is_mod,
				  	:is_gold

	belongs_to :user
	# accepts_nested_attributes_for :remote_id, :name, :comment_karma, :link_karma, :created, :is_mod, :is_gold

	def clean_attributes(attrs)
		cleaned_attrs = attrs.dup
		cleaned_attrs['remote_id'] = cleaned_attrs.delete('id')

		cleaned_attrs.each do |k, v|
			unless RedditAccount.column_names.include? k.to_s
				cleaned_attrs.delete k
			end
		end

		cleaned_attrs
	end
end