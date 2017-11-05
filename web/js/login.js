/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('#toRegister').click(function() {
       $('.loginCard').hide();
       $('.registerCard').fadeIn("slow");
    });
    
    $('.backToLoginBtn').click(function() {
       $('.registerCard').hide(); 
       $('.loginCard').fadeIn('slow');
    });
});





