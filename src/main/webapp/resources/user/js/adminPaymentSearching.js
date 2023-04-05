function search(){
	if(document.getElementById('search').value == null || document.getElementById('search').value.trim() == ''){
		location.href='/admin/payment/1/';
	}else{
		location.href='/admin/payment/1/'+document.getElementById('searchWhat').value+'/'+document.getElementById('search').value
	}
}

const searchInput = document.querySelector('input[type="search"]');

searchInput.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
	  search();
  }
});
