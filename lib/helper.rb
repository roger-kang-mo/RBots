module Helper

	def Helper.clean_attributes(class_type, attrs)
		cleaned_attrs = attrs.dup
		cleaned_attrs['remote_id'] = cleaned_attrs.delete('id')

		cleaned_attrs.each do |k, v|
			unless class_type.column_names.include? k.to_s
				cleaned_attrs.delete k
			end
		end

		cleaned_attrs
	end

	def Helper.clean_params(params)
		cleaned_params = params.dup
		cleaned_params.delete(:action)
		cleaned_params.delete(:controller)
		cleaned_params
	end

end