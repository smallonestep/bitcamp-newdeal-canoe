'use strict'

var serverApiAddr = "http://localhost:8080/bitcamp-newdeal-canoe";
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use
											// an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail()); // This is null if the
													// 'email' scope is not
													// present.
	$.get(
            //`${serverApiAddr}/json/member/checkId`,
            `http://localhost:8000/checkId`,
            {
                id: profile.getEmail()
            },
            (result)=>{
                console.log(result);
                if (result) {
                	
                } else {

                }
            },
            'text'            
        );
}