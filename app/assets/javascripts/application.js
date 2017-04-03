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
//= require turbolinks
//= require_tree .

function main()
{
	var visit = document.getElementsByClassName("visited");
	var review_form = document.getElementById("review");
	var review_text = document.getElementById("review_text");
	var allReviews = document.getElementsByClassName("reviews");
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
				alert("Error");			}
		});
	} 

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
	main();
})