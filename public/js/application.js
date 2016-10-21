$(document).ready(function() {

	deletebuttonListener();
})

var deletebuttonListener = function(){
	$('#delete_form').on("click", "#delete_recipe", function(event){
	event.preventDefault();

	var deleteForm = $(this).parent(); 
	var url = deleteForm.attr('action')

	var request = $.ajax ({
		url: url,
		method: 'delete'
	})

	request.done(function(response){
		console.log("SUCCESS")
		$('#row_to_delete').remove();
	})

})
}