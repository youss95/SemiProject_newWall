/**
 * 
 */

let page=1;
	function listLoad(){
		let loading = $('#loading');
		$.ajax({
			url:`/NewWall/proList.lost?page=${page}`,
			
			type:"get",
			dataType:"json"		
		}).done(function(resp){	
			console.log('resp:',resp[0].protectFileRealName1)
	
		
		let item = `
		<div class="row">
   <div class="row">
   
        <div class="card shadow-soft">
            <img src="/NewWall/upload/lostAnimal/${resp[0].protectFileRealName1}">
            <div class="card-body">
                <h4>${resp[0].protectName}</h4>
                <p class="fontC">
                    고양이<br>
                    암컷<br>
                    8/2/색
                </p>
                        </div>
        </div>
       
        
      
    </div> 
        
      
    </div> 
		`
		loading.append(item);
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
			listLoad();
		}
	})