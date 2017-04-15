// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require turbolinks
//= require_tree .

function main()
{
	var visit = document.getElementsByClassName("visited");
	var review_form = document.getElementById("review");
	var review_text = document.getElementById("review_text");
	var allReviews = document.getElementsByClassName("reviews");
<<<<<<< HEAD
	var deleteButton = document.getElementById("deleteButton");
	console.log(allReviews);

	visit[0].addEventListener("click", toggle);
	if(deleteButton)
	deleteButton.addEventListener('submit', deleteMyReview);

	function deleteMyReview(event)
	{ 	event.preventDefault();
		console.log(event);
		var parent = deleteButton.parentNode.parentNode.parentNode;
		var child = deleteButton.parentNode.parentNode;
		var url = "/food/review/delete/ajax";
		console.log(child.id);

		data = {
			reviewID: child.id.slice(7)
		}

		$.ajax(
		{
			url: url,
			method: "get",
			data: data,
			success: function(){
				parent.removeChild(child);
				review_text.innerHTML = "";
				visit[0].children[2].value = "Visited";
			},
			error: function(){
				alert("Error");
			}
		});

		console.log(deleteButton.parentNode.parentNode.parentNode);
		

	}
=======
>>>>>>> shubham

	var accept_image = document.getElementsByClassName("accept")[0];
	var reject_image = document.getElementsByClassName("reject")[0];
	var cancel_image = document.getElementsByClassName("cancel")[0];
	var delete_image = document.getElementsByClassName("delete")[0];

	var search_form = document.getElementById('search');

	console.log(accept_image);
	console.log(reject_image);
	console.log("hello");

	if(accept_image)
	accept_image.addEventListener('click', booking.bind('accepted'));
	if(reject_image)
	reject_image.addEventListener('click', booking.bind('rejected'));
	if(cancel_image)
	cancel_image.addEventListener('click', booking.bind('cancelled'));
	if(delete_image)
	delete_image.addEventListener('click', booking.bind('deleted'));

	function booking(event)
	{	event.preventDefault();
		console.log(event.target.id.slice(0, 6));
		var status;
		if(event.target.id.slice(0, 6) == 'accept')
			status = 'accepted'
		else if(event.target.id.slice(0, 6) == 'reject')
			status = 'rejected'
		else if(event.target.id.slice(0, 6) == 'cancel')
			status = 'cancelled'
		else if(event.target.id.slice(0, 6) == 'cancel')
			status = 'deleted'
		
		console.log("STATUS");
		console.log(status);
		
		var url = '/food/booking/status/ajax';
		var info = {
			status: status,
			bookingID: event.target.id.slice(7)
		}

		$.ajax({
			url: url,
			method: 'get',
			data: info,
			success: function(booking){
					var column = document.getElementById("status");
					if(status == 'accepted')
					{	column.innerHTML = "Confirmed!"
						column.style.color = 'green';
					}
					else if(status == 'rejected')
					{	column.innerHTML = "Rejected!"
						column.style.color = 'red';
					}
					else if(status == 'cancelled' || status == 'deleted')
					{ 	var child = cancel_image.parentNode.parentNode.parentNode;
						var parent = cancel_image.parentNode.parentNode.parentNode.parentNode
						parent.removeChild(child);
					}
			},
			error: function(){
				alert("Error");
			}
		})
	}

	console.log(allReviews);
	if(visit[0])
	{	visit[0].addEventListener("click", toggle);

		function toggle(event)
		{	event.preventDefault();
			console.log(event);
			var url = "/food/review/toggle/ajax";
			data = {
				outletID: visit[0].id.slice(9),
				category: "food"
			}

			$.ajax(
			{
				url: url,
				method: "get",
				data: data,
				success: function(object){
					console.log(object.review);
					console.log(object.status);
					console.log(object.userID);
					if(object.status == false)
					{ visit[0].children[2].value = "Not Visited";
					  if(object.review.content)
					  {	console.log("Hello")
						visit[0].style.display = "inline"
					  }
					  else
					  	review_form.style.display = "inline";	
					}
					else 
					{ console.log("hello");
					  visit[0].children[2].value = "Visited";
					  review_form.style.display = "none"
					  review_text.innerHTML = "";
					  var Mychild;
					  for(var i=0; i<allReviews.length; i++)
					  { if(object.review.customerID == object.userID)
					  	 { myReviewID = allReviews[i].id.slice(7);
					  	   Mychild = allReviews[i];
					  	   console.log(i);
					  	   break;
					  	 }	
					  }
					  console.log(Mychild);
					  if(Mychild)
					  { console.log(Mychild.parentNode);
					    var parent = Mychild.parentNode;
					    parent.removeChild(Mychild);
					  }
					}
				},
				error: function(){
					alert("Error");			
				}
			});
		}
	} 

<<<<<<< HEAD
	console.log($("#toggleOffer")[0].children[1].src);
	$("#toggleOffer").click(function(){
		$("#upDownOffer").toggle(500);
		if($("#toggleOffer")[0].children[1].src == 'https://image.flaticon.com/icons/png/128/118/118738.png')
		$("#toggleOffer")[0].children[1].src = 'http://www.iconarchive.com/download/i87622/icons8/ios7/Arrows-Up-4.ico'
		else
		$("#toggleOffer")[0].children[1].src = 'https://image.flaticon.com/icons/png/128/118/118738.png'
	})

	console.log($("#toggleReview")[0].children[1].src);
	$("#toggleReview").click(function(){
		$("#upDownReview").toggle(500);
		if($("#toggleReview")[0].children[1].src == 'https://image.flaticon.com/icons/png/128/118/118738.png')
		$("#toggleReview")[0].children[1].src = 'http://www.iconarchive.com/download/i87622/icons8/ios7/Arrows-Up-4.ico'
		else
		$("#toggleReview")[0].children[1].src = 'https://image.flaticon.com/icons/png/128/118/118738.png'
	})

}

window.addEventListener("load", function(event){
=======
	search_form[2].addEventListener('keydown', function(){
		var search_results = document.getElementById('search_results')
		if(search_form[2].value.length > 1)
		{
			var url = '/search'
			var info = {
				search: search_form[2].value
			}

			search_results.style.display = 'block'

			$.ajax({
				url: url,
				method: 'post',
				data: info,
				success: function(items){
					console.log(items);
					while (search_results.firstChild) 
					{
 					   search_results.removeChild(search_results.firstChild);
					}

					for(var i=0; i<items.length; i++)
					{ var child = document.createElement('div')
					  var text = document.createTextNode(items[i].name)
					  child.appendChild(text);
					  search_results.appendChild(child)
					  child.addEventListener('click', function(){
					  	search_form[2].value = this.innerHTML
					  })
					}
				},
				error: function(){
					alert("Error")
				}
			})
		}
		else
		{
			search_results.style.display = 'none'
		}
	})

	var search_results = document.getElementById('search_results')
	if(search_results)
	{ 
		search_results.addEventListener('click', function(){
			this.style.display = 'none'
		})

		document.body.addEventListener('click', function(event){
			console.log(event)
			var search_results = document.getElementById('search_results')  
			var x = $("#search_results").position();
			console.log(x)
			console.log(search_results.clientWidth);
			console.log(search_results.clientHeight);

			if((event.clientX < x.left || event.clientX > x.left + search_results.clientWidth) || (event.clientY < x.top || event.clientY > x.top + search_results.clientHeight))
			search_results.style.display = 'none'
			
		})
	}

}

window.addEventListener("load", function(){
>>>>>>> shubham
	main();
})