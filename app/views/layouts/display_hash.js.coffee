$('#output').html("<%= escape_javascript(render :partial => '/layouts/hash_content', :locals => { :response_data => @response_data }) %>")