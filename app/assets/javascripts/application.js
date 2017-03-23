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
	console.log(allReviews);
	visit[0].addEventListener("click", toggle);

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
}

window.addEventListener("load", main)