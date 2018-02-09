# jquery.accordion
================

A simple, lightweight, responsive jQuery Accordion

### Install
```html
<script type="text/javascript" src="jquery-1.11.2.js"></script>
<script type="text/javascript" src="jquery.accordion.js"></script>
```

### Usage
```javascript
$(function() {
	$('.panel').accordion({
		duration: 400 // default is 200,
		multiOpen: false //default is true
	});
});
```

### Options
```
duration: 400,
// animation speed of the open / close item 
multiOpen: true/false,
// default is "true". Set to "false" if you want to open one by one
```