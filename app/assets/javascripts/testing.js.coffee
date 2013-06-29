rbots.test = ->

	Browser = require("zombie")
	assert = require("Assert")

	browser = new Browser()

	browser.visit("http://localhost:3000/", ->
		assert.ok(browser.success)
		if browser.error
			console.log 'An error was encountered'
	)	

