var ready;
ready = function() {
    var buildings = new Bloodhound({
      remote: {url: "/building/autocomplete?query=%QUERY", wildcard: '%QUERY'},
      datumTokenizer: function(d) {
              return Bloodhound.tokenizers.whitespace(d.fullname, d.abbrev); },
      queryTokenizer: Bloodhound.tokenizers.whitespace
	});

	var departments = new Bloodhound({
		remote: {url: "/department/autocomplete?query=%QUERY", wildcard: '%QUERY'},
		datumTokenizer: function(d) {
              return Bloodhound.tokenizers.whitespace(d.name); },
      	queryTokenizer: Bloodhound.tokenizers.whitespace
	});

	// initialize the bloodhound suggestion engine

	var promise = buildings.initialize();
	var promise = departments.initialize();

	promise
		.done(function() { console.log('success!'); })
		.fail(function() { console.log('err!'); });

	// instantiate the typeahead UI
	$( '.typeahead').typeahead(null, {
  		displayKey: 'name',
  		source: buildings.ttAdapter()
	},{
		displayKey: 'name',
		source: departments.ttAdapter()
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);
