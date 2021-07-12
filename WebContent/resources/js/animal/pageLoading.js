let page=1;
	function listLoad(){
		let loading = $('#loading');
		$.ajax({
			url:`/NewWall/proList.lost?page=${page}`,
			
			type:"get",
			dataType:"json"		
		}).done(function(resp){	
			console.log('resp:', resp)
	resp.map((res)=>{




		let item = `
		
  
   
        <div class="card shadow-soft">
            <img src="/NewWall/upload/lostAnimal/${res.protectFileRealName1}">
            <div class="card-body">
                <h4>${res.protectName}</h4>
                <p class="fontC">
                     구조장소:${res.protectAddr}<br>
         성별:` 
   if(res.protectAddr == 'F'){
	item+=   `암컷`
} else{
	  item+=`수컷`
}
item+=`<br>`
 item+=`작성자:${res.protectWriter}
                </p>
 <a  href="/NewWall/protectDetail.lost?protectNo=${res.protectNo}&page=1" >자세히보기<i class="fas fa-angle-double-right"></i></a>
                        </div>
        </div>
       
        
		`
		loading.append(item);
		})
		}).fail(error=>{
			console.log(error)
			alert('fail')
		})
	}
	
	
	
	
	
	
	$(window).scroll(()=>{
		let checkNum = $(window).scrollTop()-($(document).height()-$(window).height() )
		console.log(checkNum)
		if(checkNum < 1 && checkNum > -1){
			page++;
			setTimeout(function() {
 			 listLoad();
			}, 50);
		}
	})