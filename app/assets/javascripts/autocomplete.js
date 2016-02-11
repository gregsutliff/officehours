var ready;
ready = function() {
    //Bloodhound is the typeahead.js suggestion engine.
    var buildings = new Bloodhound({
      remote: {url: "/buildings/autocomplete?query=%QUERY",
               wildcard: '%QUERY'
              },
      datumTokenizer: function(d) {
        return Bloodhound.tokenizers.whitespace(d.fullname, d.abbrev); },
      // This will split the input on whitespace into multiple query tokens
      queryTokenizer: Bloodhound.tokenizers.whitespace
	  });

	var departments = new Bloodhound({
		remote: {url: "/departments/autocomplete?query=%QUERY",
             wildcard: '%QUERY'
            },
		datumTokenizer: function(d) {
        return Bloodhound.tokenizers.whitespace(d.name); },
      	queryTokenizer: Bloodhound.tokenizers.whitespace
	});

  buildings.initialize();
  departments.initialize();

	// instantiate the typeahead UI
	$( '.typeahead').typeahead(null, {
  		displayKey: 'name',
      hint: true,
      highlight: true,
  		source: buildings.ttAdapter()
	},{
		displayKey: 'name',
    hint: true,
    highlight: true,
		source: departments.ttAdapter()
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
