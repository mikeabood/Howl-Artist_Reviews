$(document).ready(function(){
	$('#image').hide();
})

// api request for user input
$('#button').click(function(e){
	e.preventDefault();
	$('#image').show();

	var input = $('.artist').val()
	$("#search")[0].reset();
	console.log(input); 
	$.ajax({
		url: "https://api.spotify.com/v1/search?q=" + input + "&type=artist",
		type: 'get',
		dataType: 'json',
		success: function(res){

			console.log(res); 
			$('.coms').empty(); 
		
			var name   = res.artists.items[0].name;
  			var genres = res.artists.items[0].genres;
  			var url    = res.artists.items["0"].images[0].url;
  			var id     = res.artists.items[0].id; 
  			
  			$('#name').text(name);
			$('#image').attr("src", url);
			$('#genre').empty(); 
			$('#artist').val(id); 

			$('#genre').append("<li>" + genres[0] + "</li>");
			

			// Getting comment id from local DB
			$.ajax({
				url: "http://localhost:9393/comment/" + id,
				type: 'get',
				dataType: 'json',
				success: function(comments){
				
					for(i=0; i < comments.length; i++){
						$('.coms').append("<li>" + "<h4>" + comments[i].user.username + "</h4>" + ' ' + "<h2>" + " ' " + comments[i].comment + " ' " + "<h2>" + "</li>"); 
					}

					console.log(comments)

				},
				error: function(err){
					console.log(err); 
				}
			})
		},
		error: function(err){
			console.log(err); 
		}
	})
})

// posting to the wall 
$('.comment-button').click(function(e){
	e.preventDefault(); 
	var input = $('#comment').val(); 
	var artist = $('#artist').val(); 
	var comment = {comment: input, artist_id: artist}; 
	$("#form")[0].reset();

		$.ajax({
			url: "http://localhost:9393/artist",
			type: 'POST',
			dataType: 'json',
			data: comment,
			success: function(res){
				console.log(res)

				$('.coms').append("<li>" + "<h4>" + res.user.username + "</h4>" + "<h2>" +  " ' " + res.comment + " ' " + "</h2>" + "</li>")


			},
			error: function(err){
				console.log(err);   
			}
		});
})


