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
			console.log('resp:', resp)
	resp.map((res)=>{

		let item = `

        <div class="card shadow-soft">
            <img src="/NewWall/upload/lostAnimal/${res.protectFileRealName1}">
            <div class="card-body">
                <h4>${res.protectName}</h4>
                <p class="fontC">
                    고양이<br>
                    암컷<br>
                    8/2/색
                </p>
 <a href="/NewWall/protectDetail.lost?protectNo=${res.protectNo}" class="btn_m btn_light">상세</a>
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
			listLoad();
		}
	})