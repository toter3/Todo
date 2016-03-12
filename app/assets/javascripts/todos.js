// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//window.onload = function(){
    
   
    
//}
//

var done_tasks = document.getElementsByClassName('strikeout'); 
var dis_dones = true;

// runs when a 'done' checkbox is changed
function done_change(id){
    
    if ($('#'+id).hasClass('strikeout')){
        
        //$('#'+id).removeClass('strikeout');
        is_done = 0;
    }
    else{
        
        //$('#'+id).addClass('strikeout');
        is_done = 1;
    }
    
    
    $.ajax({
    url: "/todos/update_done",
    type: "POST",
    data: {id: id,
           todo: {
             //action: 'update',
             //id: id, 
             done: is_done }},
    success: function(a,b,return_obj){
        if(return_obj.status == '200'){
            mark_line(id,is_done);;
        }
        else{
            alert ("somthing went wrong!");
        }; 
    }
        
    });
};

function display_dones(){
    
    if(dis_dones){
        
        dis_dones = false;
        display_tasks = 'none';
    }
    else{
        dis_dones = true;
        display_tasks = '';
    };
    
    for(var x = 0; x < done_tasks.length; x++){
            done_tasks[x].style.display = display_tasks;
    };
};

//function save_changes(){
//    alert(changed_tasks);
//};

function mark_line(id, is_done){
    
    if (is_done == 0){
        
        $('#'+id).removeClass('strikeout');   
    }
    else{
        $('#'+id).addClass('strikeout');
    };
    
};


