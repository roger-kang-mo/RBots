rbots.landing = (args) ->

	$(document).ready -> 
		initTips()
		
	$('.action-header').click ->
		attachedContent = $(this).next('.action-content')
		if attachedContent.hasClass('off')
			$(this).find('.panel-expand').addClass('open').attr('title', 'click to hide')
			attachedContent.slideDown().removeClass('off')
		else
			$(this).find('.panel-expand').removeClass('open').attr('title', 'click to show')
			attachedContent.slideUp().addClass('off')

	$(document).on 'click', '.ul-title', (e) -> toggleHashExpand(e)
	$(document).on 'click', '.hash-expand', (e) -> toggleHashExpand(e)

	toggleHashExpand = (e) ->
		parentElem = $(e.target).parent()
		title = parentElem.children('.ul-title')
		expandIcon = parentElem.children('.hash-expand')
		if expandIcon.hasClass('collapsed')
			expandIcon.removeClass('collapsed')
			title.attr('title', 'click to collapse') if title
			parentElem.children('ol, ul').children('li').slideDown()
		else
			expandIcon.addClass('collapsed')
			title.attr('title', 'click to expand') if title
			parentElem.children('ol, ul').children('li').slideUp()

	$('.request-field').keyup (e) -> submitRequest(e) if e.which == 13
	$('.content-submit').click (e) -> submitRequest(e)

	submitRequest = (e) ->
		parentPanel = $(e.target).parents('.action-content')
		loader = $('.loader', parentPanel)
		emptyField = false
		ajaxUrl = $('.content-submit', parentPanel).data('url')
		sendData = {}

		fields = $('.request-field', parentPanel)

		for i in [0..fields.length-1] by 1
			currentField = $(fields[i])
			if currentField.val()
				sendData[currentField.data('field')] = currentField.val()
			else
				emptyField = true

		if emptyField
			fields.each ->
				unless $(this).val()
					$(this).css({borderColor: "red"})
			$('#output').html("<h4>All fields are required.</h4>")
		else
			loader.show()
			$.ajax
				url: ajaxUrl
				data: sendData
				complete: -> 
					$('.loader:visible').hide()
					initTips()

	# 💩💩💩💩💩

	initTips = ->
		$('.tips').qtip
		    content:
		      attr: 'title'
		    position:
		      my: 'bottom center'
		      at: 'top center'
		    adjust:
		    	y: -5


