module Helper

	def Helper.clean_attributes(attrs, params)
		cleaned_params = params.dup
		if cleaned_params['id']
			cleaned_params['remote_id'] = cleaned_params.delete('id')
		end

		attrs_list = attrs.column_names if not attrs.is_a?(Array)
		cleaned_params.each do |k, v|
			unless attrs_list.include? k.to_s
				cleaned_params.delete k
			end
		end

		cleaned_params
	end

	def Helper.clean_params(params)
		cleaned_params = params.dup
		cleaned_params.delete(:action)
		cleaned_params.delete(:controller)
		cleaned_params
	end

end