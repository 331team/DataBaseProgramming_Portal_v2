const tabBtn = document.getElementsByClassName("tab_menu_btn");
const selected = document.getElementById("selected");

function select(){
	Array.from(tabBtn).forEach(btn =>
		btn.classList.remove("on"));
	selectBtn = document.getElementById(selected.getAttribute('value'));
	console.log(selectBtn);
	selectBtn.classList.add("on");
	console.log(selectBtn);
}

select();