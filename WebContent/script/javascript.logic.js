var myId;
var page = document.getElementsByClassName("page")[0];
var alone_show = true;
var showUpdate = function(id) {
	if(alone_show){
        page.style.visibility = "hidden";
        setTimeout(function(){
            var update = document.getElementById("update");
            update.style["display"] = "block";
            $("#update").addClass("animated slideInLeft");
            alone_show = false;
		},100);


	}
    getId(id);
	//test();
	}

	var showInsert = function() {
        page.style.visibility = "hidden";
		if(alone_show){

            setTimeout(function(){

                var insert_page = document.getElementById("insert");
                insert_page.style["display"] = "block";
                $("#insert").addClass("animated slideInLeft");
                alone_show = false;
			},100)

		}

	}
	var getId = function(id) {
		var m_id = document.getElementById("getId");
		m_id.setAttribute("value",id) ;
		
	}
