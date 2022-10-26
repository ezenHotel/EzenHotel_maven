$(document).ready(function() {

	$("div#memberListWrap #delBtn").click(function() {

		let chkdNums = [];
		$("div#memberListWrap input[name='memberChk']:checked").each(function() {
			chkdNums.push($(this).val());
		});
		let del = confirm("정말 삭제하시겠습니까?");

		if (del) {

			console.log(chkdNums);
			
			location.href="/memberDel?chkdNums=" + chkdNums

		}

	});
	
	$("div#memberListWrap #detailBtn").click(function(){
		
	});

})