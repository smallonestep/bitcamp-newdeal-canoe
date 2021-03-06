'use strict'

var serverApiAddr = "http://localhost:8080/bitcamp-newdeal-canoe";
function logIn(profile) {
	var loginUser; // 세션을 담을 변수
    $.getJSON(
        `${serverApiAddr}/json/auth/sessionCheck`,
        (result) => {
            if (result.loginUser) {
                loginUser = result.loginUser;
                $('.login-no').addClass('hide');
                $('.login-status').removeClass('hide');
            } else {
                $('.login-no').removeClass('hide');
                $('.login-status').addClass('hide');
            }
        });
	$.get(
			//`http://localhost:8000/checkId`,
            `${serverApiAddr}/json/member/checkGID`,
            {
                id: profile.getEmail()
            },
            (result)=>{
            	
                console.log(result.gMember);
                //console.log(result.gMember.memberPwd);
                
                
                $.post(
                        `${serverApiAddr}/json/auth/gLogIn`, 
                        {
                            id: result.gMember.memberId,
                        }, 
                        (result) => {
                            console.log(result)
                            if (result.status === 'success') {

                                //loginUser = result.loginUser;
                                if (result.loginUser) {
                                    loginUser = result.loginUser;
                                    $('.login-no').addClass('hide');
                                    $('.login-status').removeClass('hide');
                                } else {
                                    $('.login-no').removeClass('hide');
                                    $('.login-status').addClass('hide');
                                }
                            } else {
                                swal({
                                    type: 'error',
                                    title: '로그인 실패',
                                    text: '아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다'
                                })
                            }
                        }, 
                        'json')
                        .fail((e) => {
                            swal({
                                type: 'error',
                                title: '서버 요청 중 오류 발생!'
                            })
                            console.log(e);
                        });
                if (result) {
                	
                } else {

                }
            },
            'json'            
        );
}
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use
											// an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail()); // This is null if the
													// 'email' scope is not
													// present.
	logIn(profile);
	
}