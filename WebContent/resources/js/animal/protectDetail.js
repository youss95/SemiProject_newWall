/**
 * 
 */


function addReply(result){
	
	var replyItem = `<li id="reply-${result.replyNo}" class="media">`;
	replyItem += `<div class="media-body">`;
	replyItem += `<strong class="text-success">${result.protectWriter}</strong>`;
	replyItem += `<span class="newText"><i>new</i></span>`
	replyItem += `<p>${result.replyCon}</p></div>`;
	replyItem += `<div class="m-2">`;
	
	replyItem += `	<i onclick="deleteReply(${result.replyNo})" class="fas fa-trash-alt"></i>`;
	
	$("#reply__list").prepend(replyItem);
}


